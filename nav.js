/* cross-cutting behaviour, loaded in <head> on every page:
     1. mark the document as JS-capable, before first paint, so CSS can hide reveal targets
        without ever risking a blank page when the script doesn't run
     2. directional page transitions — pages enter from the side you're heading toward and
        leave the same way you came, so the spatial relationship between the root and its
        subpages survives navigation. Chromium gets native cross-document @view-transition;
        browsers without it (Firefox today) get a JS slide+fade that mirrors the direction
     3. scroll reveal — apple.com brings sections in as they cross into the viewport
     4. appearance switch — Light / Dark / Auto, applied before first paint                  */
(function () {
  var root = document.documentElement;
  var DIR_KEY = 'apatel.navdir';
  var THEME_KEY = 'apatel.theme';
  var reduced = window.matchMedia && matchMedia('(prefers-reduced-motion:reduce)').matches;
  var darkQ = window.matchMedia ? matchMedia('(prefers-color-scheme: dark)') : null;

  root.classList.add('js');

  /* ── appearance ───────────────────────────────────────────────────────────────────────
     Runs immediately, not on DOMContentLoaded: this script is a blocking <script> in
     <head>, so setting the attribute here happens before the first paint and the page
     never flashes the wrong theme. */
  function storedTheme() {
    try {
      var v = localStorage.getItem(THEME_KEY);
      return (v === 'light' || v === 'dark') ? v : 'auto';
    } catch (_) { return 'auto'; }
  }
  function applyTheme(mode) {
    if (mode === 'auto') root.removeAttribute('data-theme');
    else root.setAttribute('data-theme', mode);
  }
  var theme = storedTheme();
  applyTheme(theme);

  /* Direction is read from the site's shape: index.html is the root, everything else hangs
     off it. Heading to index = back, anywhere else = forward. */
  function dirFor(url) {
    var p = url.pathname.replace(/\/$/, '/index.html');
    return /(^|\/)index\.html$/.test(p) ? 'back' : 'fwd';
  }

  /* Applied before first paint, so the incoming page already knows which way it arrived. In a
     cross-document view transition the NEW document's styles drive both snapshots. */
  try {
    var incoming = sessionStorage.getItem(DIR_KEY);
    if (incoming) { root.setAttribute('data-nav', incoming); sessionStorage.removeItem(DIR_KEY); }
  } catch (_) {}

  var css =
    '@media (prefers-reduced-motion:no-preference){' +
      /* native cross-document view transitions */
      'html[data-nav]::view-transition-old(root),html[data-nav]::view-transition-new(root){' +
        'animation-duration:.34s;animation-timing-function:cubic-bezier(.2,.7,.2,1);}' +
      'html[data-nav="fwd"]::view-transition-old(root){animation-name:vt-out-left;}' +
      'html[data-nav="fwd"]::view-transition-new(root){animation-name:vt-in-right;}' +
      /* mirrored curve on the return path so back retraces the way you came */
      'html[data-nav="back"]::view-transition-old(root){animation-name:vt-out-right;' +
        'animation-timing-function:cubic-bezier(.8,.3,.8,.3);}' +
      'html[data-nav="back"]::view-transition-new(root){animation-name:vt-in-left;}' +
      '@keyframes vt-out-left{to{transform:translateX(-4%);opacity:0;}}' +
      '@keyframes vt-in-right{from{transform:translateX(4%);opacity:0;}}' +
      '@keyframes vt-out-right{to{transform:translateX(4%);opacity:0;}}' +
      '@keyframes vt-in-left{from{transform:translateX(-4%);opacity:0;}}' +
      /* JS fallback (no view-transition support): same direction, same distance */
      'html.nav-out body{opacity:0;transition:opacity .16s ease,transform .16s cubic-bezier(.2,.7,.2,1);}' +
      'html.nav-out[data-leaving="fwd"] body{transform:translateX(-4%);}' +
      'html.nav-out[data-leaving="back"] body{transform:translateX(4%);}' +
    '}';
  var st = document.createElement('style');
  st.textContent = css;
  document.head.appendChild(st);

  function record(url) { try { sessionStorage.setItem(DIR_KEY, dirFor(url)); } catch (_) {} }

  var native = 'onpagereveal' in window;

  document.addEventListener('click', function (e) {
    if (e.defaultPrevented || e.button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return;
    var a = e.target.closest ? e.target.closest('a[href]') : null;
    if (!a || a.target === '_blank' || a.hasAttribute('download')) return;
    var url;
    try { url = new URL(a.getAttribute('href'), location.href); } catch (_) { return; }
    if (url.origin !== location.origin) return;                                      // external
    if (url.pathname === location.pathname && url.search === location.search) return; // in-page hash

    record(url);
    if (native || reduced) return;          // browser handles it, or motion is unwanted

    e.preventDefault();
    root.setAttribute('data-leaving', dirFor(url));
    root.classList.add('nav-out');
    setTimeout(function () { location.href = url.href; }, 160);
  });

  /* Skip links are an accessibility shortcut, so they jump instantly — animating them makes a
     keyboard user sit through 300ms of scrolling to reach content they asked for directly. The
     smooth `scroll-behavior` on <html> stays for ordinary in-page anchors. */
  document.addEventListener('click', function (e) {
    var a = e.target.closest ? e.target.closest('a.vh[href^="#"]') : null;
    if (!a) return;
    var target = document.getElementById(a.getAttribute('href').slice(1));
    if (!target) return;
    e.preventDefault();
    target.scrollIntoView({ behavior: 'instant', block: 'start' });
    target.focus({ preventScroll: true });
    if (document.activeElement !== target) target.setAttribute('tabindex', '-1'), target.focus();
    history.replaceState(null, '', a.getAttribute('href'));
  });

  // reset the fade if the page is restored from the back/forward cache
  window.addEventListener('pageshow', function (ev) {
    if (ev.persisted) { root.classList.remove('nav-out'); root.removeAttribute('data-leaving'); }
  });

  // browser back/forward: the direction is the reverse of the link that got you here
  window.addEventListener('popstate', function () {
    try { sessionStorage.setItem(DIR_KEY, 'back'); } catch (_) {}
  });

  /* ── scroll reveal ────────────────────────────────────────────────────────────────────
     Reveal once and unobserve — an element that re-hides when you scroll back up reads as a
     glitch, not an effect. Anything already on screen at load reveals immediately. */
  function reveals() {
    var targets = document.querySelectorAll('.reveal');
    if (!targets.length) return;
    if (reduced || !('IntersectionObserver' in window)) {
      for (var i = 0; i < targets.length; i++) targets[i].classList.add('in');
      return;
    }
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (!en.isIntersecting) return;
        en.target.classList.add('in');
        io.unobserve(en.target);
      });
    }, { rootMargin: '0px 0px -12% 0px', threshold: 0.06 });
    targets.forEach(function (t) { io.observe(t); });
  }

  /* ── appearance switch UI ─────────────────────────────────────────────────────────────
     Injected rather than written into all five pages: the control is useless without JS, so
     rendering it in the markup would only ever produce a dead button for a no-JS visitor. */
  var ICONS = {
    auto: '<svg viewBox="0 0 16 16" aria-hidden="true">' +
            '<circle cx="8" cy="8" r="6.1" fill="none" stroke="currentColor" stroke-width="1.5"/>' +
            '<path d="M8 1.9a6.1 6.1 0 010 12.2z" fill="currentColor"/></svg>',
    light: '<svg viewBox="0 0 16 16" aria-hidden="true">' +
            '<circle cx="8" cy="8" r="3.1" fill="currentColor"/>' +
            '<g stroke="currentColor" stroke-width="1.5" stroke-linecap="round">' +
            '<path d="M8 .9v1.8M8 13.3v1.8M.9 8h1.8M13.3 8h1.8"/>' +
            '<path d="M2.98 2.98l1.27 1.27M11.75 11.75l1.27 1.27M13.02 2.98l-1.27 1.27M4.25 11.75l-1.27 1.27"/>' +
            '</g></svg>',
    dark:  '<svg viewBox="0 0 16 16" aria-hidden="true">' +
            '<path d="M13.6 10.2A5.9 5.9 0 015.8 2.4a6.2 6.2 0 107.8 7.8z" fill="currentColor"/></svg>'
  };
  var MODES = ['auto', 'light', 'dark'];
  var LABELS = { auto: 'Match system appearance', light: 'Light appearance', dark: 'Dark appearance' };

  function themeSwitch() {
    var bar = document.querySelector('.gnav-in');
    if (!bar) return;

    var group = document.createElement('div');
    group.className = 'theme';
    group.setAttribute('role', 'radiogroup');
    group.setAttribute('aria-label', 'Appearance');

    MODES.forEach(function (mode) {
      var b = document.createElement('button');
      b.type = 'button';
      b.setAttribute('role', 'radio');
      b.setAttribute('aria-label', LABELS[mode]);
      b.title = LABELS[mode];
      b.dataset.mode = mode;
      b.innerHTML = '<span>' + ICONS[mode] + '</span>';
      b.addEventListener('click', function () { choose(mode); });
      group.appendChild(b);
    });

    /* radiogroup keyboard contract: arrows move between options, and only the selected
       option is in the tab order */
    group.addEventListener('keydown', function (e) {
      var i = MODES.indexOf(theme);
      if (e.key === 'ArrowRight' || e.key === 'ArrowDown') i = (i + 1) % MODES.length;
      else if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') i = (i + MODES.length - 1) % MODES.length;
      else return;
      e.preventDefault();
      choose(MODES[i]);
      group.querySelector('[data-mode="' + MODES[i] + '"]').focus();
    });

    bar.appendChild(group);

    function sync() {
      MODES.forEach(function (mode) {
        var b = group.querySelector('[data-mode="' + mode + '"]');
        var on = mode === theme;
        b.setAttribute('aria-checked', String(on));
        b.tabIndex = on ? 0 : -1;
      });
      paintMeta();
    }
    function choose(mode) {
      theme = mode;
      applyTheme(mode);
      try {
        if (mode === 'auto') localStorage.removeItem(THEME_KEY);
        else localStorage.setItem(THEME_KEY, mode);
      } catch (_) {}
      sync();
    }
    sync();

    // in auto, a system change repaints the browser chrome colour too
    if (darkQ && darkQ.addEventListener) darkQ.addEventListener('change', paintMeta);
    else if (darkQ && darkQ.addListener) darkQ.addListener(paintMeta);
  }

  /* The page ships two media-scoped theme-color metas so a no-JS visitor still gets matching
     browser chrome. Once JS is running the choice may not match the system any more, so take
     over with a single meta driven by the resolved background. */
  function paintMeta() {
    var stale = document.querySelectorAll('meta[name="theme-color"][media]');
    for (var i = 0; i < stale.length; i++) stale[i].remove();
    var m = document.querySelector('meta[name="theme-color"]:not([media])');
    if (!m) {
      m = document.createElement('meta');
      m.name = 'theme-color';
      document.head.appendChild(m);
    }
    var bg = getComputedStyle(root).getPropertyValue('--page').trim();
    if (bg) m.content = bg;
  }

  function ready() { reveals(); themeSwitch(); }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', ready);
  else ready();
})();
