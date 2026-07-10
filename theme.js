/* shared palette engine — themes every page from a random tinted-theming
   Base16/Base24 scheme (window.__SCHEMES, loaded from schemes.js).
   sets tokens: --bg --bg-2 --ink --ink-soft --rule --rule-2 --accent
   wires #shuffleBtn (reroll) and #schemeTag (label) when the DOM is ready. */
(function () {
  var root = document.documentElement;
  var S = window.__SCHEMES || [];
  var lastName = '';

  function hexRGB(h){ h=h.replace('#',''); return [parseInt(h.slice(0,2),16),parseInt(h.slice(2,4),16),parseInt(h.slice(4,6),16)]; }
  function lum(r){ var a=r.map(function(v){v/=255; return v<=0.03928?v/12.92:Math.pow((v+0.055)/1.055,2.4);}); return 0.2126*a[0]+0.7152*a[1]+0.0722*a[2]; }
  function contrast(a,b){ var l1=lum(a),l2=lum(b); return (Math.max(l1,l2)+0.05)/(Math.min(l1,l2)+0.05); }
  function rgba(r,a){ return 'rgba('+r[0]+','+r[1]+','+r[2]+','+a+')'; }

  function apply(s){
    var hx=s[2], c=[]; for(var i=0;i<16;i++) c.push('#'+hx.substr(i*6,6));
    var bg=hexRGB(c[0]), fg=hexRGB(c[5]);
    var dark=(s[1]==='d')||(s[1]!=='l' && lum(bg)<0.4);
    var cand=[13,14,12,11,9,8].map(function(i){return c[i];});
    var best=cand.filter(function(h){return contrast(hexRGB(h),bg)>=2.4;});
    var ac=best.length?best[Math.floor(Math.random()*best.length)]:c[13];
    var st=root.style;
    st.setProperty('--bg',c[0]); st.setProperty('--bg-2',c[1]);
    st.setProperty('--ink',c[5]); st.setProperty('--ink-soft',c[3]);
    st.setProperty('--rule',rgba(fg,dark?0.14:0.18));
    st.setProperty('--rule-2',rgba(fg,dark?0.07:0.10));
    st.setProperty('--accent',ac);
    var mc=document.querySelector('meta[name="theme-color"]');
    if(!mc){ mc=document.createElement('meta'); mc.name='theme-color'; document.head.appendChild(mc); }
    mc.content=c[0];
    window.__accent=hexRGB(ac); window.__dark=dark;
    lastName=s[0];
    var tag=document.getElementById('schemeTag'); if(tag) tag.innerHTML='<b>'+lastName+'</b>';
  }
  function rand(){ return S.length ? S[Math.floor(Math.random()*S.length)] : ['default','d','09090b0f0f12181818313131565654edece8f5e0dcb4befeff5555ffb86cf1fa8c50fa7b8be9fdbd93f9ff79c6ffb86c']; }

  window.__applyScheme=apply; window.__randScheme=rand;
  apply(rand());

  document.addEventListener('DOMContentLoaded', function(){
    var tag=document.getElementById('schemeTag'); if(tag) tag.innerHTML='<b>'+lastName+'</b>';
    var b=document.getElementById('shuffleBtn'); if(b) b.addEventListener('click', function(){ apply(rand()); });
  });

  // press "r" anywhere to reroll the palette
  document.addEventListener('keydown', function(e){
    if(e.key!=='r'||e.metaKey||e.ctrlKey||e.altKey) return;
    if(/^(input|textarea|select)$/i.test(e.target.tagName||'')) return;
    apply(rand());
  });
})();
