/* cross-cutting UI, loaded on every page (kept in one file so it stays DRY):
   1. themed scrollbar — Firefox standard props + WebKit pseudo-elements
   2. page-transition fallback — Chromium uses native cross-document
      @view-transition; browsers without it (e.g. Firefox today) get a JS
      crossfade so navigation still feels smooth. */
(function () {
  var css =
    'html{scrollbar-color:var(--accent) transparent;scrollbar-width:thin;}' +
    '::-webkit-scrollbar{width:10px;height:10px;}' +
    '::-webkit-scrollbar-track{background:transparent;}' +
    '::-webkit-scrollbar-thumb{background:color-mix(in srgb,var(--accent) 70%,transparent);border:2px solid var(--bg);}' +
    '::-webkit-scrollbar-thumb:hover{background:var(--accent);}' +
    '@media (prefers-reduced-motion:no-preference){html.nav-out body{opacity:0;transition:opacity .16s ease;}}';
  var st = document.createElement('style');
  st.textContent = css;
  document.head.appendChild(st);

  // native cross-document view transitions -> let the browser handle it
  if ('onpagereveal' in window) return;
  if (window.matchMedia && matchMedia('(prefers-reduced-motion:reduce)').matches) return;

  document.addEventListener('click', function (e) {
    if (e.defaultPrevented || e.button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return;
    var a = e.target.closest ? e.target.closest('a[href]') : null;
    if (!a || a.target === '_blank' || a.hasAttribute('download')) return;
    var url;
    try { url = new URL(a.getAttribute('href'), location.href); } catch (_) { return; }
    if (url.origin !== location.origin) return;                             // external
    if (url.pathname === location.pathname && url.search === location.search) return; // in-page hash
    e.preventDefault();
    document.documentElement.classList.add('nav-out');
    setTimeout(function () { location.href = url.href; }, 160);
  });

  // reset the fade if the page is restored from the back/forward cache
  window.addEventListener('pageshow', function (ev) {
    if (ev.persisted) document.documentElement.classList.remove('nav-out');
  });
})();
