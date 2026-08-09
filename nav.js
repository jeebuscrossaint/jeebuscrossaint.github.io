/* cross-cutting UI, loaded on every page (kept in one file so it stays DRY):
   1. themed scrollbar — Firefox standard props + WebKit pseudo-elements
   2. directional page transitions — pages enter from the side you're heading
      toward and leave the same way you came, so the spatial relationship between
      index and its subpages survives navigation. Chromium gets native
      cross-document @view-transition; browsers without it (Firefox today) get a
      JS slide+fade that mirrors the same direction. */
(function () {
  var root = document.documentElement;
  var DIR_KEY = 'apatel.navdir';

  /* Direction is read from the site's shape: index.html is the root, everything
     else hangs off it. Heading to index = back, anywhere else = forward. */
  function dirFor(url) {
    var p = url.pathname.replace(/\/$/, '/index.html');
    return /(^|\/)index\.html$/.test(p) ? 'back' : 'fwd';
  }

  /* Applied before first paint (this script is in <head>), so the incoming page
     already knows which way it arrived. In a cross-document view transition the
     NEW document's styles drive both the old and new snapshots. */
  try {
    var incoming = sessionStorage.getItem(DIR_KEY);
    if (incoming) { root.setAttribute('data-nav', incoming); sessionStorage.removeItem(DIR_KEY); }
  } catch (_) {}

  var css =
    'html{scrollbar-color:var(--accent) transparent;scrollbar-width:thin;}' +
    '::-webkit-scrollbar{width:10px;height:10px;}' +
    '::-webkit-scrollbar-track{background:transparent;}' +
    '::-webkit-scrollbar-thumb{background:color-mix(in srgb,var(--accent) 70%,transparent);border:2px solid var(--bg);}' +
    '::-webkit-scrollbar-thumb:hover{background:var(--accent);}' +
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
      '@keyframes vt-out-left{to{transform:translateX(-5%);opacity:0;}}' +
      '@keyframes vt-in-right{from{transform:translateX(5%);opacity:0;}}' +
      '@keyframes vt-out-right{to{transform:translateX(5%);opacity:0;}}' +
      '@keyframes vt-in-left{from{transform:translateX(-5%);opacity:0;}}' +
      /* JS fallback (no view-transition support): same direction, same distance */
      'html.nav-out body{opacity:0;transition:opacity .16s ease,transform .16s cubic-bezier(.2,.7,.2,1);}' +
      'html.nav-out[data-leaving="fwd"] body{transform:translateX(-5%);}' +
      'html.nav-out[data-leaving="back"] body{transform:translateX(5%);}' +
    '}';
  var st = document.createElement('style');
  st.textContent = css;
  document.head.appendChild(st);

  function record(url) { try { sessionStorage.setItem(DIR_KEY, dirFor(url)); } catch (_) {} }

  // native cross-document view transitions -> record the direction, let the browser animate
  var native = 'onpagereveal' in window;
  var reduced = window.matchMedia && matchMedia('(prefers-reduced-motion:reduce)').matches;

  document.addEventListener('click', function (e) {
    if (e.defaultPrevented || e.button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return;
    var a = e.target.closest ? e.target.closest('a[href]') : null;
    if (!a || a.target === '_blank' || a.hasAttribute('download')) return;
    var url;
    try { url = new URL(a.getAttribute('href'), location.href); } catch (_) { return; }
    if (url.origin !== location.origin) return;                             // external
    if (url.pathname === location.pathname && url.search === location.search) return; // in-page hash

    record(url);
    if (native || reduced) return;          // browser handles it, or motion is unwanted

    e.preventDefault();
    root.setAttribute('data-leaving', dirFor(url));
    root.classList.add('nav-out');
    setTimeout(function () { location.href = url.href; }, 160);
  });

  // reset the fade if the page is restored from the back/forward cache
  window.addEventListener('pageshow', function (ev) {
    if (ev.persisted) { root.classList.remove('nav-out'); root.removeAttribute('data-leaving'); }
  });

  // browser back/forward: the direction is the reverse of the link that got you here
  window.addEventListener('popstate', function () {
    try { sessionStorage.setItem(DIR_KEY, 'back'); } catch (_) {}
  });
})();
