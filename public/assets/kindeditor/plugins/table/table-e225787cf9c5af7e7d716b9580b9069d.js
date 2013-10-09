/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("table",function(e){function t(e,t){t=t.toUpperCase(),e.css("background-color",t),e.css("color","#000000"===t?"#FFFFFF":"#000000"),e.html(t)}function n(n,i){function r(){e.each(l,function(){this.remove()}),l=[],e(document).unbind("click,mousedown",r),n.unbind("click,mousedown",r)}i.bind("click,mousedown",function(e){e.stopPropagation()}),i.click(function(){r();var i=e(this),o=i.pos(),s=e.colorpicker({x:o.x,y:o.y+i.height(),z:811214,selectedColor:e(this).html(),colors:a.colorTable,noColor:a.lang("noColor"),shadowMode:a.shadowMode,click:function(e){t(i,e),r()}});l.push(s),e(document).bind("click,mousedown",r),n.bind("click,mousedown",r)})}function i(e,t,n){for(var i=0,a=0,r=t.cells.length;r>a&&t.cells[a]!=n;a++)i+=t.cells[a].rowSpan-1;return n.cellIndex-i}var a=this,r="table",o=a.lang(r+"."),s="ke-zeroborder",l=[];a.plugin.table={prop:function(i){var l=['<div style="padding:20px;">','<div class="ke-dialog-row">','<label for="keRows" style="width:90px;">'+o.cells+"</label>",o.rows+' <input type="text" id="keRows" class="ke-input-text ke-input-number" name="rows" value="" maxlength="4" /> &nbsp; ',o.cols+' <input type="text" class="ke-input-text ke-input-number" name="cols" value="" maxlength="4" />',"</div>",'<div class="ke-dialog-row">','<label for="keWidth" style="width:90px;">'+o.size+"</label>",o.width+' <input type="text" id="keWidth" class="ke-input-text ke-input-number" name="width" value="" maxlength="4" /> &nbsp; ','<select name="widthType">','<option value="%">'+o.percent+"</option>",'<option value="px">'+o.px+"</option>","</select> &nbsp; ",o.height+' <input type="text" class="ke-input-text ke-input-number" name="height" value="" maxlength="4" /> &nbsp; ','<select name="heightType">','<option value="%">'+o.percent+"</option>",'<option value="px">'+o.px+"</option>","</select>","</div>",'<div class="ke-dialog-row">','<label for="kePadding" style="width:90px;">'+o.space+"</label>",o.padding+' <input type="text" id="kePadding" class="ke-input-text ke-input-number" name="padding" value="" maxlength="4" /> &nbsp; ',o.spacing+' <input type="text" class="ke-input-text ke-input-number" name="spacing" value="" maxlength="4" />',"</div>",'<div class="ke-dialog-row">','<label for="keAlign" style="width:90px;">'+o.align+"</label>",'<select id="keAlign" name="align">','<option value="">'+o.alignDefault+"</option>",'<option value="left">'+o.alignLeft+"</option>",'<option value="center">'+o.alignCenter+"</option>",'<option value="right">'+o.alignRight+"</option>","</select>","</div>",'<div class="ke-dialog-row">','<label for="keBorder" style="width:90px;">'+o.border+"</label>",o.borderWidth+' <input type="text" id="keBorder" class="ke-input-text ke-input-number" name="border" value="" maxlength="4" /> &nbsp; ',o.borderColor+' <span class="ke-inline-block ke-input-color"></span>',"</div>",'<div class="ke-dialog-row">','<label for="keBgColor" style="width:90px;">'+o.backgroundColor+"</label>",'<span class="ke-inline-block ke-input-color"></span>',"</div>","</div>"].join(""),d=a.createDialog({name:r,width:500,title:a.lang(r),body:l,beforeRemove:function(){w.unbind()},yesBtn:{name:a.lang("yes"),click:function(){var t=u.val(),n=h.val(),i=p.val(),r=f.val(),o=m.val(),l=g.val(),d=v.val(),c=_.val(),C=b.val(),x=y.val(),T=e(w[0]).html()||"",E=e(w[1]).html()||"";if(0==t||!/^\d+$/.test(t))return alert(a.lang("invalidRows")),u[0].focus(),void 0;if(0==n||!/^\d+$/.test(n))return alert(a.lang("invalidRows")),h[0].focus(),void 0;if(!/^\d*$/.test(i))return alert(a.lang("invalidWidth")),p[0].focus(),void 0;if(!/^\d*$/.test(r))return alert(a.lang("invalidHeight")),f[0].focus(),void 0;if(!/^\d*$/.test(d))return alert(a.lang("invalidPadding")),v[0].focus(),void 0;if(!/^\d*$/.test(c))return alert(a.lang("invalidSpacing")),_[0].focus(),void 0;if(!/^\d*$/.test(x))return alert(a.lang("invalidBorder")),y[0].focus(),void 0;if(k)return""!==i?k.width(i+o):k.css("width",""),void 0!==k[0].width&&k.removeAttr("width"),""!==r?k.height(r+l):k.css("height",""),void 0!==k[0].height&&k.removeAttr("height"),k.css("background-color",E),void 0!==k[0].bgColor&&k.removeAttr("bgColor"),""!==d?k[0].cellPadding=d:k.removeAttr("cellPadding"),""!==c?k[0].cellSpacing=c:k.removeAttr("cellSpacing"),""!==C?k[0].align=C:k.removeAttr("align"),""!==x?k.attr("border",x):k.removeAttr("border"),""===x||"0"===x?k.addClass(s):k.removeClass(s),""!==T?k.attr("borderColor",T):k.removeAttr("borderColor"),a.hideDialog().focus(),void 0;var S="";""!==i&&(S+="width:"+i+o+";"),""!==r&&(S+="height:"+r+l+";"),""!==E&&(S+="background-color:"+E+";");var N="<table";""!==S&&(N+=' style="'+S+'"'),""!==d&&(N+=' cellpadding="'+d+'"'),""!==c&&(N+=' cellspacing="'+c+'"'),""!==C&&(N+=' align="'+C+'"'),""!==x&&(N+=' border="'+x+'"'),(""===x||"0"===x)&&(N+=' class="'+s+'"'),""!==T&&(N+=' bordercolor="'+T+'"'),N+=">";for(var A=0;t>A;A++){N+="<tr>";for(var D=0;n>D;D++)N+="<td>"+(e.IE?"&nbsp;":"<br />")+"</td>";N+="</tr>"}N+="</table>",e.IE||(N+="<br />"),a.insertHtml(N),a.select().hideDialog().focus(),a.addBookmark()}}}),c=d.div,u=e('[name="rows"]',c).val(3),h=e('[name="cols"]',c).val(2),p=e('[name="width"]',c).val(100),f=e('[name="height"]',c),m=e('[name="widthType"]',c),g=e('[name="heightType"]',c),v=e('[name="padding"]',c).val(2),_=e('[name="spacing"]',c).val(0),b=e('[name="align"]',c),y=e('[name="border"]',c).val(1),w=e(".ke-input-color",c);n(c,w.eq(0)),n(c,w.eq(1)),t(w.eq(0),"#000000"),t(w.eq(1),""),u[0].focus(),u[0].select();var k;if(!i&&(k=a.plugin.getSelectedTable())){u.val(k[0].rows.length),h.val(k[0].rows.length>0?k[0].rows[0].cells.length:0),u.attr("disabled",!0),h.attr("disabled",!0);var C,x=k[0].style.width||k[0].width,T=k[0].style.height||k[0].height;void 0!==x&&(C=/^(\d+)((?:px|%)*)$/.exec(x))?(p.val(C[1]),m.val(C[2])):p.val(""),void 0!==T&&(C=/^(\d+)((?:px|%)*)$/.exec(T))&&(f.val(C[1]),g.val(C[2])),v.val(k[0].cellPadding||""),_.val(k[0].cellSpacing||""),b.val(k[0].align||""),y.val(void 0===k[0].border?"":k[0].border),t(w.eq(0),e.toHex(k.attr("borderColor")||"")),t(w.eq(1),e.toHex(k[0].style.backgroundColor||k[0].bgColor||"")),p[0].focus(),p[0].select()}},cellprop:function(){var i=['<div style="padding:20px;">','<div class="ke-dialog-row">','<label for="keWidth" style="width:90px;">'+o.size+"</label>",o.width+' <input type="text" id="keWidth" class="ke-input-text ke-input-number" name="width" value="" maxlength="4" /> &nbsp; ','<select name="widthType">','<option value="%">'+o.percent+"</option>",'<option value="px">'+o.px+"</option>","</select> &nbsp; ",o.height+' <input type="text" class="ke-input-text ke-input-number" name="height" value="" maxlength="4" /> &nbsp; ','<select name="heightType">','<option value="%">'+o.percent+"</option>",'<option value="px">'+o.px+"</option>","</select>","</div>",'<div class="ke-dialog-row">','<label for="keAlign" style="width:90px;">'+o.align+"</label>",o.textAlign+' <select id="keAlign" name="textAlign">','<option value="">'+o.alignDefault+"</option>",'<option value="left">'+o.alignLeft+"</option>",'<option value="center">'+o.alignCenter+"</option>",'<option value="right">'+o.alignRight+"</option>","</select> ",o.verticalAlign+' <select name="verticalAlign">','<option value="">'+o.alignDefault+"</option>",'<option value="top">'+o.alignTop+"</option>",'<option value="middle">'+o.alignMiddle+"</option>",'<option value="bottom">'+o.alignBottom+"</option>",'<option value="baseline">'+o.alignBaseline+"</option>","</select>","</div>",'<div class="ke-dialog-row">','<label for="keBorder" style="width:90px;">'+o.border+"</label>",o.borderWidth+' <input type="text" id="keBorder" class="ke-input-text ke-input-number" name="border" value="" maxlength="4" /> &nbsp; ',o.borderColor+' <span class="ke-inline-block ke-input-color"></span>',"</div>",'<div class="ke-dialog-row">','<label for="keBgColor" style="width:90px;">'+o.backgroundColor+"</label>",'<span class="ke-inline-block ke-input-color"></span>',"</div>","</div>"].join(""),s=a.createDialog({name:r,width:500,title:a.lang("tablecell"),body:i,beforeRemove:function(){_.unbind()},yesBtn:{name:a.lang("yes"),click:function(){var t=d.val(),n=c.val(),i=u.val(),r=h.val(),o=(p.val(),f.val(),m.val()),s=g.val(),l=v.val(),b=e(_[0]).html()||"",w=e(_[1]).html()||"";return/^\d*$/.test(t)?/^\d*$/.test(n)?/^\d*$/.test(l)?(y.css({width:""!==t?t+i:"",height:""!==n?n+r:"","background-color":w,"text-align":o,"vertical-align":s,"border-width":l,"border-style":""!==l?"solid":"","border-color":b}),a.hideDialog().focus(),a.addBookmark(),void 0):(alert(a.lang("invalidBorder")),v[0].focus(),void 0):(alert(a.lang("invalidHeight")),c[0].focus(),void 0):(alert(a.lang("invalidWidth")),d[0].focus(),void 0)}}}),l=s.div,d=e('[name="width"]',l).val(100),c=e('[name="height"]',l),u=e('[name="widthType"]',l),h=e('[name="heightType"]',l),p=e('[name="padding"]',l).val(2),f=e('[name="spacing"]',l).val(0),m=e('[name="textAlign"]',l),g=e('[name="verticalAlign"]',l),v=e('[name="border"]',l).val(1),_=e(".ke-input-color",l);n(l,_.eq(0)),n(l,_.eq(1)),t(_.eq(0),"#000000"),t(_.eq(1),""),d[0].focus(),d[0].select();var b,y=a.plugin.getSelectedCell(),w=y[0].style.width||y[0].width||"",k=y[0].style.height||y[0].height||"";(b=/^(\d+)((?:px|%)*)$/.exec(w))?(d.val(b[1]),u.val(b[2])):d.val(""),(b=/^(\d+)((?:px|%)*)$/.exec(k))&&(c.val(b[1]),h.val(b[2])),m.val(y[0].style.textAlign||""),g.val(y[0].style.verticalAlign||"");var C=y[0].style.borderWidth||"";C&&(C=parseInt(C)),v.val(C),t(_.eq(0),e.toHex(y[0].style.borderColor||"")),t(_.eq(1),e.toHex(y[0].style.backgroundColor||"")),d[0].focus(),d[0].select()},insert:function(){this.prop(!0)},"delete":function(){var e=a.plugin.getSelectedTable();a.cmd.range.setStartBefore(e[0]).collapse(!0),a.cmd.select(),e.remove(),a.addBookmark()},colinsert:function(t){var n=a.plugin.getSelectedTable()[0],r=a.plugin.getSelectedRow()[0],o=a.plugin.getSelectedCell()[0],s=o.cellIndex+t;s+=n.rows[0].cells.length-r.cells.length;for(var l=0,d=n.rows.length;d>l;l++){var c=n.rows[l],u=c.insertCell(s);u.innerHTML=e.IE?"":"<br />",s=i(n,c,u)}a.cmd.range.selectNodeContents(o).collapse(!0),a.cmd.select(),a.addBookmark()},colinsertleft:function(){this.colinsert(0)},colinsertright:function(){this.colinsert(1)},rowinsert:function(t){var n=a.plugin.getSelectedTable()[0],i=a.plugin.getSelectedRow()[0],r=a.plugin.getSelectedCell()[0],o=i.rowIndex;1===t&&(o=i.rowIndex+(r.rowSpan-1)+t);for(var s=n.insertRow(o),l=0,d=i.cells.length;d>l;l++){i.cells[l].rowSpan>1&&(d-=i.cells[l].rowSpan-1);var c=s.insertCell(l);1===t&&i.cells[l].colSpan>1&&(c.colSpan=i.cells[l].colSpan),c.innerHTML=e.IE?"":"<br />"}for(var u=o;u>=0;u--){var h=n.rows[u].cells;if(h.length>l){for(var p=r.cellIndex;p>=0;p--)h[p].rowSpan>1&&(h[p].rowSpan+=1);break}}a.cmd.range.selectNodeContents(r).collapse(!0),a.cmd.select(),a.addBookmark()},rowinsertabove:function(){this.rowinsert(0)},rowinsertbelow:function(){this.rowinsert(1)},rowmerge:function(){var e=a.plugin.getSelectedTable()[0],t=a.plugin.getSelectedRow()[0],n=a.plugin.getSelectedCell()[0],i=t.rowIndex,r=i+n.rowSpan,o=e.rows[r];if(!(e.rows.length<=r)){var s=n.cellIndex;if(!(o.cells.length<=s)){var l=o.cells[s];n.colSpan===l.colSpan&&(n.rowSpan+=l.rowSpan,o.deleteCell(s),a.cmd.range.selectNodeContents(n).collapse(!0),a.cmd.select(),a.addBookmark())}}},colmerge:function(){var e=(a.plugin.getSelectedTable()[0],a.plugin.getSelectedRow()[0]),t=a.plugin.getSelectedCell()[0],n=(e.rowIndex,t.cellIndex),i=n+1;if(!(e.cells.length<=i)){var r=e.cells[i];t.rowSpan===r.rowSpan&&(t.colSpan+=r.colSpan,e.deleteCell(i),a.cmd.range.selectNodeContents(t).collapse(!0),a.cmd.select(),a.addBookmark())}},rowsplit:function(){var t=a.plugin.getSelectedTable()[0],n=a.plugin.getSelectedRow()[0],r=a.plugin.getSelectedCell()[0],o=n.rowIndex;if(1!==r.rowSpan){for(var s=i(t,n,r),l=1,d=r.rowSpan;d>l;l++){var c=t.rows[o+l],u=c.insertCell(s);r.colSpan>1&&(u.colSpan=r.colSpan),u.innerHTML=e.IE?"":"<br />",s=i(t,c,u)}e(r).removeAttr("rowSpan"),a.cmd.range.selectNodeContents(r).collapse(!0),a.cmd.select(),a.addBookmark()}},colsplit:function(){var t=(a.plugin.getSelectedTable()[0],a.plugin.getSelectedRow()[0]),n=a.plugin.getSelectedCell()[0],i=n.cellIndex;if(1!==n.colSpan){for(var r=1,o=n.colSpan;o>r;r++){var s=t.insertCell(i+r);n.rowSpan>1&&(s.rowSpan=n.rowSpan),s.innerHTML=e.IE?"":"<br />"}e(n).removeAttr("colSpan"),a.cmd.range.selectNodeContents(n).collapse(!0),a.cmd.select(),a.addBookmark()}},coldelete:function(){for(var t=a.plugin.getSelectedTable()[0],n=a.plugin.getSelectedRow()[0],i=a.plugin.getSelectedCell()[0],r=i.cellIndex,o=0,s=t.rows.length;s>o;o++){var l=t.rows[o],d=l.cells[r];d.colSpan>1?(d.colSpan-=1,1===d.colSpan&&e(d).removeAttr("colSpan")):l.deleteCell(r),d.rowSpan>1&&(o+=d.rowSpan-1)}0===n.cells.length?(a.cmd.range.setStartBefore(t).collapse(!0),a.cmd.select(),e(t).remove()):a.cmd.selection(!0),a.addBookmark()},rowdelete:function(){for(var t=a.plugin.getSelectedTable()[0],n=a.plugin.getSelectedRow()[0],i=a.plugin.getSelectedCell()[0],r=n.rowIndex,o=i.rowSpan-1;o>=0;o--)t.deleteRow(r+o);0===t.rows.length?(a.cmd.range.setStartBefore(t).collapse(!0),a.cmd.select(),e(t).remove()):a.cmd.selection(!0),a.addBookmark()}},a.clickToolbar(r,a.plugin.table.prop)});