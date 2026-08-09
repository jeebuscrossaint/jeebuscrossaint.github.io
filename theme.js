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

  /* Base16 schemes are authored for terminals, not for body copy: ~8% put base05 under
     4.5:1 against their own base00, and 83% do it for base03. Rather than trust the scheme,
     pick the nearest entry that clears WCAG AA — and fall back to plain black/white if the
     whole palette is too flat. Nothing on the page should be a value nobody checked. */
  function pickInk(bg, c){
    var order=[5,6,7,4,3,2,1,0];
    for(var i=0;i<order.length;i++){
      var h=c[order[i]];
      if(contrast(hexRGB(h),bg)>=4.5) return h;
    }
    return lum(bg)<0.5 ? '#ffffff' : '#000000';
  }
  function pickSoft(bg, c, inkR){
    // secondary text stays dimmer than --ink so the hierarchy survives, but still clears AA
    var cand=[3,4,2,6,5,7,1], out=null, outR=99;
    for(var i=0;i<cand.length;i++){
      var r=contrast(hexRGB(c[cand[i]]),bg);
      if(r>=4.5 && r<outR && r<=inkR){ outR=r; out=c[cand[i]]; }
    }
    return out || pickInk(bg,c);
  }

  function apply(s, forced){
    var hx=s[2], c=[]; for(var i=0;i<16;i++) c.push('#'+hx.substr(i*6,6));
    var bg=hexRGB(c[0]);
    var inkHex=pickInk(bg,c), inkR=contrast(hexRGB(inkHex),bg);
    var softHex=pickSoft(bg,c,inkR);
    var fg=hexRGB(inkHex);
    var dark=(s[1]==='d')||(s[1]!=='l' && lum(bg)<0.4);
    var cand=[13,14,12,11,9,8].map(function(i){return c[i];});
    var best=cand.filter(function(h){return contrast(hexRGB(h),bg)>=2.4;});
    // reuse the stored accent so navigation keeps one palette; else pick fresh
    var ac=(forced&&/^#[0-9a-f]{6}$/i.test(forced))?forced:(best.length?best[Math.floor(Math.random()*best.length)]:c[13]);
    var st=root.style;
    st.setProperty('--bg',c[0]); st.setProperty('--bg-2',c[1]);
    st.setProperty('--ink',inkHex); st.setProperty('--ink-soft',softHex);
    st.setProperty('--rule',rgba(fg,dark?0.14:0.18));
    st.setProperty('--rule-2',rgba(fg,dark?0.07:0.10));
    st.setProperty('--accent',ac);
    var mc=document.querySelector('meta[name="theme-color"]');
    if(!mc){ mc=document.createElement('meta'); mc.name='theme-color'; document.head.appendChild(mc); }
    mc.content=c[0];
    window.__accent=hexRGB(ac); window.__dark=dark;
    lastName=s[0];
    save(s[0], ac);
    var tag=document.getElementById('schemeTag'); if(tag) tag.innerHTML='<b>'+lastName+'</b>';
  }
  function rand(){ return S.length ? S[Math.floor(Math.random()*S.length)] : ['default','d','09090b0f0f12181818313131565654edece8f5e0dcb4befeff5555ffb86cf1fa8c50fa7b8be9fdbd93f9ff79c6ffb86c']; }

  // persist the chosen palette so it stays put across navigation within a visit
  // (sessionStorage -> fresh random palette each new session, stable while browsing)
  var KEY='apatel.palette';
  function save(n,a){ try{ sessionStorage.setItem(KEY, JSON.stringify({n:n,a:a})); }catch(e){} }
  function read(){ try{ return JSON.parse(sessionStorage.getItem(KEY)); }catch(e){ return null; } }
  function byName(n){ for(var i=0;i<S.length;i++) if(S[i][0]===n) return S[i]; return null; }
  function restore(){ var p=read(); if(p&&p.n){ var s=byName(p.n); if(s){ apply(s,p.a); return; } } apply(rand()); }

  window.__applyScheme=apply; window.__randScheme=rand;
  restore();

  document.addEventListener('DOMContentLoaded', function(){
    var tag=document.getElementById('schemeTag'); if(tag) tag.innerHTML='<b>'+lastName+'</b>';
    var b=document.getElementById('shuffleBtn'); if(b) b.addEventListener('click', function(){ apply(rand()); });
  });
})();
