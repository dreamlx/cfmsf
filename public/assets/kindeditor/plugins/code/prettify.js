var q=null;window.PR_SHOULD_USE_CONTINUATION=!0,function(){function e(e){function t(e){var t=e.charCodeAt(0);if(92!==t)return t;var n=e.charAt(1);return(t=u[n])?t:n>="0"&&"7">=n?parseInt(e.substring(1),8):"u"===n||"x"===n?parseInt(e.substring(2),16):e.charCodeAt(1)}function n(e){return 32>e?(16>e?"\\x0":"\\x")+e.toString(16):(e=String.fromCharCode(e),("\\"===e||"-"===e||"["===e||"]"===e)&&(e="\\"+e),e)}function i(e){for(var i=e.substring(1,e.length-1).match(/\\u[\dA-Fa-f]{4}|\\x[\dA-Fa-f]{2}|\\[0-3][0-7]{0,2}|\\[0-7]{1,2}|\\[\S\s]|[^\\]/g),e=[],r=[],a="^"===i[0],o=a?1:0,s=i.length;s>o;++o){var l=i[o];if(/\\[bdsw]/i.test(l))e.push(l);else{var c,l=t(l);s>o+2&&"-"===i[o+1]?(c=t(i[o+2]),o+=2):c=l,r.push([l,c]),65>c||l>122||(65>c||l>90||r.push([32|Math.max(65,l),32|Math.min(c,90)]),97>c||l>122||r.push([-33&Math.max(97,l),-33&Math.min(c,122)]))}}for(r.sort(function(e,t){return e[0]-t[0]||t[1]-e[1]}),i=[],l=[0/0,0/0],o=0;o<r.length;++o)s=r[o],s[0]<=l[1]+1?l[1]=Math.max(l[1],s[1]):i.push(l=s);for(r=["["],a&&r.push("^"),r.push.apply(r,e),o=0;o<i.length;++o)s=i[o],r.push(n(s[0])),s[1]>s[0]&&(s[1]+1>s[0]&&r.push("-"),r.push(n(s[1])));return r.push("]"),r.join("")}function r(e){for(var t=e.source.match(/\[(?:[^\\\]]|\\[\S\s])*]|\\u[\dA-Fa-f]{4}|\\x[\dA-Fa-f]{2}|\\\d+|\\[^\dux]|\(\?[!:=]|[()^]|[^()[\\^]+/g),n=t.length,r=[],s=0,l=0;n>s;++s){var c=t[s];"("===c?++l:"\\"===c.charAt(0)&&(c=+c.substring(1))&&l>=c&&(r[c]=-1)}for(s=1;s<r.length;++s)-1===r[s]&&(r[s]=++a);for(l=s=0;n>s;++s)c=t[s],"("===c?(++l,void 0===r[l]&&(t[s]="(?:")):"\\"===c.charAt(0)&&(c=+c.substring(1))&&l>=c&&(t[s]="\\"+r[l]);for(l=s=0;n>s;++s)"^"===t[s]&&"^"!==t[s+1]&&(t[s]="");if(e.ignoreCase&&o)for(s=0;n>s;++s)c=t[s],e=c.charAt(0),c.length>=2&&"["===e?t[s]=i(c):"\\"!==e&&(t[s]=c.replace(/[A-Za-z]/g,function(e){return e=e.charCodeAt(0),"["+String.fromCharCode(-33&e,32|e)+"]"}));return t.join("")}for(var a=0,o=!1,s=!1,l=0,c=e.length;c>l;++l){var d=e[l];if(d.ignoreCase)s=!0;else if(/[a-z]/i.test(d.source.replace(/\\u[\da-f]{4}|\\x[\da-f]{2}|\\[^UXux]/gi,""))){o=!0,s=!1;break}}for(var u={b:8,t:9,n:10,v:11,f:12,r:13},h=[],l=0,c=e.length;c>l;++l){if(d=e[l],d.global||d.multiline)throw Error(""+d);h.push("(?:"+r(d)+")")}return RegExp(h.join("|"),s?"gi":"g")}function t(e){function t(e){switch(e.nodeType){case 1:if(i.test(e.className))break;for(var n=e.firstChild;n;n=n.nextSibling)t(n);n=e.nodeName,("BR"===n||"LI"===n)&&(r[s]="\n",o[s<<1]=a++,o[1|s++<<1]=e);break;case 3:case 4:n=e.nodeValue,n.length&&(n=l?n.replace(/\r\n?/g,"\n"):n.replace(/[\t\n\r ]+/g," "),r[s]=n,o[s<<1]=a,a+=n.length,o[1|s++<<1]=e)}}var n,i=/(?:^|\s)nocode(?:\s|$)/,r=[],a=0,o=[],s=0;e.currentStyle?n=e.currentStyle.whiteSpace:window.getComputedStyle&&(n=document.defaultView.getComputedStyle(e,q).getPropertyValue("white-space"));var l=n&&"pre"===n.substring(0,3);return t(e),{a:r.join("").replace(/\n$/,""),c:o}}function n(e,t,n,i){t&&(e={a:t,d:e},n(e),i.push.apply(i,e.e))}function i(t,i){function r(e){for(var t=e.d,c=[t,"pln"],d=0,u=e.a.match(a)||[],h={},f=0,p=u.length;p>f;++f){var m,g=u[f],v=h[g],_=void 0;if("string"==typeof v)m=!1;else{var b=o[g.charAt(0)];if(b)_=g.match(b[1]),v=b[0];else{for(m=0;l>m;++m)if(b=i[m],_=g.match(b[1])){v=b[0];break}_||(v="pln")}!(m=v.length>=5&&"lang-"===v.substring(0,5))||_&&"string"==typeof _[1]||(m=!1,v="src"),m||(h[g]=v)}if(b=d,d+=g.length,m){m=_[1];var y=g.indexOf(m),w=y+m.length;_[2]&&(w=g.length-_[2].length,y=w-m.length),v=v.substring(5),n(t+b,g.substring(0,y),r,c),n(t+b+y,m,s(v,m),c),n(t+b+w,g.substring(w),r,c)}else c.push(t+b,v)}e.e=c}var a,o={};!function(){for(var n=t.concat(i),r=[],s={},l=0,c=n.length;c>l;++l){var d=n[l],u=d[3];if(u)for(var h=u.length;--h>=0;)o[u.charAt(h)]=d;d=d[1],u=""+d,s.hasOwnProperty(u)||(r.push(d),s[u]=q)}r.push(/[\S\s]/),a=e(r)}();var l=i.length;return r}function r(e){var t=[],n=[];e.tripleQuotedStrings?t.push(["str",/^(?:'''(?:[^'\\]|\\[\S\s]|''?(?=[^']))*(?:'''|$)|"""(?:[^"\\]|\\[\S\s]|""?(?=[^"]))*(?:"""|$)|'(?:[^'\\]|\\[\S\s])*(?:'|$)|"(?:[^"\\]|\\[\S\s])*(?:"|$))/,q,"'\""]):e.multiLineStrings?t.push(["str",/^(?:'(?:[^'\\]|\\[\S\s])*(?:'|$)|"(?:[^"\\]|\\[\S\s])*(?:"|$)|`(?:[^\\`]|\\[\S\s])*(?:`|$))/,q,"'\"`"]):t.push(["str",/^(?:'(?:[^\n\r'\\]|\\.)*(?:'|$)|"(?:[^\n\r"\\]|\\.)*(?:"|$))/,q,"\"'"]),e.verbatimStrings&&n.push(["str",/^@"(?:[^"]|"")*(?:"|$)/,q]);var r=e.hashComments;return r&&(e.cStyleComments?(r>1?t.push(["com",/^#(?:##(?:[^#]|#(?!##))*(?:###|$)|.*)/,q,"#"]):t.push(["com",/^#(?:(?:define|elif|else|endif|error|ifdef|include|ifndef|line|pragma|undef|warning)\b|[^\n\r]*)/,q,"#"]),n.push(["str",/^<(?:(?:(?:\.\.\/)*|\/?)(?:[\w-]+(?:\/[\w-]+)+)?[\w-]+\.h|[a-z]\w*)>/,q])):t.push(["com",/^#[^\n\r]*/,q,"#"])),e.cStyleComments&&(n.push(["com",/^\/\/[^\n\r]*/,q]),n.push(["com",/^\/\*[\S\s]*?(?:\*\/|$)/,q])),e.regexLiterals&&n.push(["lang-regex",/^(?:^^\.?|[!+-]|!=|!==|#|%|%=|&|&&|&&=|&=|\(|\*|\*=|\+=|,|-=|->|\/|\/=|:|::|;|<|<<|<<=|<=|=|==|===|>|>=|>>|>>=|>>>|>>>=|[?@[^]|\^=|\^\^|\^\^=|{|\||\|=|\|\||\|\|=|~|break|case|continue|delete|do|else|finally|instanceof|return|throw|try|typeof)\s*(\/(?=[^*/])(?:[^/[\\]|\\[\S\s]|\[(?:[^\\\]]|\\[\S\s])*(?:]|$))+\/)/]),(r=e.types)&&n.push(["typ",r]),e=(""+e.keywords).replace(/^ | $/g,""),e.length&&n.push(["kwd",RegExp("^(?:"+e.replace(/[\s,]+/g,"|")+")\\b"),q]),t.push(["pln",/^\s+/,q," \r\n	 "]),n.push(["lit",/^@[$_a-z][\w$@]*/i,q],["typ",/^(?:[@_]?[A-Z]+[a-z][\w$@]*|\w+_t\b)/,q],["pln",/^[$_a-z][\w$@]*/i,q],["lit",/^(?:0x[\da-f]+|(?:\d(?:_\d+)*\d*(?:\.\d*)?|\.\d\+)(?:e[+-]?\d+)?)[a-z]*/i,q,"0123456789"],["pln",/^\\[\S\s]?/,q],["pun",/^.[^\s\w"-$'./@\\`]*/,q]),i(t,n)}function a(e,t){function n(e){switch(e.nodeType){case 1:if(a.test(e.className))break;if("BR"===e.nodeName)i(e),e.parentNode&&e.parentNode.removeChild(e);else for(e=e.firstChild;e;e=e.nextSibling)n(e);break;case 3:case 4:if(l){var t=e.nodeValue,r=t.match(o);if(r){var c=t.substring(0,r.index);e.nodeValue=c,(t=t.substring(r.index+r[0].length))&&e.parentNode.insertBefore(s.createTextNode(t),e.nextSibling),i(e),c||e.parentNode.removeChild(e)}}}}function i(e){function t(e,n){var i=n?e.cloneNode(!1):e,r=e.parentNode;if(r){var r=t(r,1),a=e.nextSibling;r.appendChild(i);for(var o=a;o;o=a)a=o.nextSibling,r.appendChild(o)}return i}for(;!e.nextSibling;)if(e=e.parentNode,!e)return;for(var n,e=t(e.nextSibling,0);(n=e.parentNode)&&1===n.nodeType;)e=n;c.push(e)}var r,a=/(?:^|\s)nocode(?:\s|$)/,o=/\r\n?|\n/,s=e.ownerDocument;e.currentStyle?r=e.currentStyle.whiteSpace:window.getComputedStyle&&(r=s.defaultView.getComputedStyle(e,q).getPropertyValue("white-space"));var l=r&&"pre"===r.substring(0,3);for(r=s.createElement("LI");e.firstChild;)r.appendChild(e.firstChild);for(var c=[r],d=0;d<c.length;++d)n(c[d]);t===(0|t)&&c[0].setAttribute("value",t);var u=s.createElement("OL");u.className="linenums";for(var h=Math.max(0,0|t-1)||0,d=0,f=c.length;f>d;++d)r=c[d],r.className="L"+(d+h)%10,r.firstChild||r.appendChild(s.createTextNode(" ")),u.appendChild(r);e.appendChild(u)}function o(e,t){for(var n=t.length;--n>=0;){var i=t[n];b.hasOwnProperty(i)?window.console&&console.warn("cannot override language handler %s",i):b[i]=e}}function s(e,t){return e&&b.hasOwnProperty(e)||(e=/^\s*</.test(t)?"default-markup":"default-code"),b[e]}function l(e){var n=e.g;try{var i=t(e.h),r=i.a;e.a=r,e.c=i.c,e.d=0,s(n,r)(e);var a=/\bMSIE\b/.test(navigator.userAgent),n=/\n/g,o=e.a,l=o.length,i=0,c=e.c,d=c.length,r=0,u=e.e,h=u.length,e=0;u[h]=l;var f,p;for(p=f=0;h>p;)u[p]!==u[p+2]?(u[f++]=u[p++],u[f++]=u[p++]):p+=2;for(h=f,p=f=0;h>p;){for(var m=u[p],g=u[p+1],v=p+2;h>=v+2&&u[v+1]===g;)v+=2;u[f++]=m,u[f++]=g,p=v}for(u.length=f;d>r;){var _,b=c[r+2]||l,y=u[e+2]||l,v=Math.min(b,y),w=c[r+1];if(1!==w.nodeType&&(_=o.substring(i,v))){a&&(_=_.replace(n,"\r")),w.nodeValue=_;var k=w.ownerDocument,C=k.createElement("SPAN");C.className=u[e+1];var x=w.parentNode;x.replaceChild(C,w),C.appendChild(w),b>i&&(c[r+1]=w=k.createTextNode(o.substring(v,b)),x.insertBefore(w,C.nextSibling))}i=v,i>=b&&(r+=2),i>=y&&(e+=2)}}catch(T){"console"in window&&console.log(T&&T.stack?T.stack:T)}}var c=["break,continue,do,else,for,if,return,while"],d=[[c,"auto,case,char,const,default,double,enum,extern,float,goto,int,long,register,short,signed,sizeof,static,struct,switch,typedef,union,unsigned,void,volatile"],"catch,class,delete,false,import,new,operator,private,protected,public,this,throw,true,try,typeof"],u=[d,"alignof,align_union,asm,axiom,bool,concept,concept_map,const_cast,constexpr,decltype,dynamic_cast,explicit,export,friend,inline,late_check,mutable,namespace,nullptr,reinterpret_cast,static_assert,static_cast,template,typeid,typename,using,virtual,where"],h=[d,"abstract,boolean,byte,extends,final,finally,implements,import,instanceof,null,native,package,strictfp,super,synchronized,throws,transient"],f=[h,"as,base,by,checked,decimal,delegate,descending,dynamic,event,fixed,foreach,from,group,implicit,in,interface,internal,into,is,lock,object,out,override,orderby,params,partial,readonly,ref,sbyte,sealed,stackalloc,string,select,uint,ulong,unchecked,unsafe,ushort,var"],d=[d,"debugger,eval,export,function,get,null,set,undefined,var,with,Infinity,NaN"],p=[c,"and,as,assert,class,def,del,elif,except,exec,finally,from,global,import,in,is,lambda,nonlocal,not,or,pass,print,raise,try,with,yield,False,True,None"],m=[c,"alias,and,begin,case,class,def,defined,elsif,end,ensure,false,in,module,next,nil,not,or,redo,rescue,retry,self,super,then,true,undef,unless,until,when,yield,BEGIN,END"],c=[c,"case,done,elif,esac,eval,fi,function,in,local,set,then,until"],g=/^(DIR|FILE|vector|(de|priority_)?queue|list|stack|(const_)?iterator|(multi)?(set|map)|bitset|u?(int|float)\d*)/,v=/\S/,_=r({keywords:[u,f,d,"caller,delete,die,do,dump,elsif,eval,exit,foreach,for,goto,if,import,last,local,my,next,no,our,print,package,redo,require,sub,undef,unless,until,use,wantarray,while,BEGIN,END"+p,m,c],hashComments:!0,cStyleComments:!0,multiLineStrings:!0,regexLiterals:!0}),b={};o(_,["default-code"]),o(i([],[["pln",/^[^<?]+/],["dec",/^<!\w[^>]*(?:>|$)/],["com",/^<\!--[\S\s]*?(?:--\>|$)/],["lang-",/^<\?([\S\s]+?)(?:\?>|$)/],["lang-",/^<%([\S\s]+?)(?:%>|$)/],["pun",/^(?:<[%?]|[%?]>)/],["lang-",/^<xmp\b[^>]*>([\S\s]+?)<\/xmp\b[^>]*>/i],["lang-js",/^<script\b[^>]*>([\S\s]*?)(<\/script\b[^>]*>)/i],["lang-css",/^<style\b[^>]*>([\S\s]*?)(<\/style\b[^>]*>)/i],["lang-in.tag",/^(<\/?[a-z][^<>]*>)/i]]),["default-markup","htm","html","mxml","xhtml","xml","xsl"]),o(i([["pln",/^\s+/,q," 	\r\n"],["atv",/^(?:"[^"]*"?|'[^']*'?)/,q,"\"'"]],[["tag",/^^<\/?[a-z](?:[\w-.:]*\w)?|\/?>$/i],["atn",/^(?!style[\s=]|on)[a-z](?:[\w:-]*\w)?/i],["lang-uq.val",/^=\s*([^\s"'>]*(?:[^\s"'/>]|\/(?=\s)))/],["pun",/^[/<->]+/],["lang-js",/^on\w+\s*=\s*"([^"]+)"/i],["lang-js",/^on\w+\s*=\s*'([^']+)'/i],["lang-js",/^on\w+\s*=\s*([^\s"'>]+)/i],["lang-css",/^style\s*=\s*"([^"]+)"/i],["lang-css",/^style\s*=\s*'([^']+)'/i],["lang-css",/^style\s*=\s*([^\s"'>]+)/i]]),["in.tag"]),o(i([],[["atv",/^[\S\s]+/]]),["uq.val"]),o(r({keywords:u,hashComments:!0,cStyleComments:!0,types:g}),["c","cc","cpp","cxx","cyc","m"]),o(r({keywords:"null,true,false"}),["json"]),o(r({keywords:f,hashComments:!0,cStyleComments:!0,verbatimStrings:!0,types:g}),["cs"]),o(r({keywords:h,cStyleComments:!0}),["java"]),o(r({keywords:c,hashComments:!0,multiLineStrings:!0}),["bsh","csh","sh"]),o(r({keywords:p,hashComments:!0,multiLineStrings:!0,tripleQuotedStrings:!0}),["cv","py"]),o(r({keywords:"caller,delete,die,do,dump,elsif,eval,exit,foreach,for,goto,if,import,last,local,my,next,no,our,print,package,redo,require,sub,undef,unless,until,use,wantarray,while,BEGIN,END",hashComments:!0,multiLineStrings:!0,regexLiterals:!0}),["perl","pl","pm"]),o(r({keywords:m,hashComments:!0,multiLineStrings:!0,regexLiterals:!0}),["rb"]),o(r({keywords:d,cStyleComments:!0,regexLiterals:!0}),["js"]),o(r({keywords:"all,and,by,catch,class,else,extends,false,finally,for,if,in,is,isnt,loop,new,no,not,null,of,off,on,or,return,super,then,true,try,unless,until,when,while,yes",hashComments:3,cStyleComments:!0,multilineStrings:!0,tripleQuotedStrings:!0,regexLiterals:!0}),["coffee"]),o(i([],[["str",/^[\S\s]+/]]),["regex"]),window.prettyPrintOne=function(e,t,n){var i=document.createElement("PRE");return i.innerHTML=e,n&&a(i,n),l({g:t,i:n,h:i}),i.innerHTML},window.prettyPrint=function(e){function t(){for(var n=window.PR_SHOULD_USE_CONTINUATION?c.now()+250:1/0;u<i.length&&c.now()<n;u++){var r=i[u],o=r.className;if(o.indexOf("prettyprint")>=0){var s,f,o=o.match(h);if(f=!o){f=r;for(var p=void 0,m=f.firstChild;m;m=m.nextSibling)var g=m.nodeType,p=1===g?p?f:m:3===g?v.test(m.nodeValue)?f:p:p;f=(s=p===f?void 0:p)&&"CODE"===s.tagName}for(f&&(o=s.className.match(h)),o&&(o=o[1]),f=!1,p=r.parentNode;p;p=p.parentNode)if(("pre"===p.tagName||"code"===p.tagName||"xmp"===p.tagName)&&p.className&&p.className.indexOf("prettyprint")>=0){f=!0;break}f||((f=(f=r.className.match(/\blinenums\b(?::(\d+))?/))?f[1]&&f[1].length?+f[1]:!0:!1)&&a(r,f),d={g:o,h:r,i:f},l(d))}}u<i.length?setTimeout(t,250):e&&e()}for(var n=[document.getElementsByTagName("pre"),document.getElementsByTagName("code"),document.getElementsByTagName("xmp")],i=[],r=0;r<n.length;++r)for(var o=0,s=n[r].length;s>o;++o)i.push(n[r][o]);var n=q,c=Date;c.now||(c={now:function(){return+new Date}});var d,u=0,h=/\blang(?:uage)?-([\w.]+)(?!\S)/;t()},window.PR={createSimpleLexer:i,registerLangHandler:o,sourceDecorator:r,PR_ATTRIB_NAME:"atn",PR_ATTRIB_VALUE:"atv",PR_COMMENT:"com",PR_DECLARATION:"dec",PR_KEYWORD:"kwd",PR_LITERAL:"lit",PR_NOCODE:"nocode",PR_PLAIN:"pln",PR_PUNCTUATION:"pun",PR_SOURCE:"src",PR_STRING:"str",PR_TAG:"tag",PR_TYPE:"typ"}}();