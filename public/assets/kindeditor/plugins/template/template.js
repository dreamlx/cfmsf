/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("template",function(e){function t(t){return r+t+"?ver="+encodeURIComponent(e.DEBUG?e.TIME:e.VERSION)}var n=this,i="template",r=(n.lang(i+"."),n.pluginsPath+i+"/html/");n.clickToolbar(i,function(){var r=n.lang(i+"."),a=['<div style="padding:10px 20px;">','<div class="ke-header">','<div class="ke-left">',r.selectTemplate+" <select>"];e.each(r.fileList,function(e,t){a.push('<option value="'+e+'">'+t+"</option>")}),html=[a.join(""),"</select></div>",'<div class="ke-right">','<input type="checkbox" id="keReplaceFlag" name="replaceFlag" value="1" /> <label for="keReplaceFlag">'+r.replaceContent+"</label>","</div>",'<div class="ke-clearfix"></div>',"</div>",'<iframe class="ke-textarea" frameborder="0" style="width:458px;height:260px;background-color:#FFF;"></iframe>',"</div>"].join("");var o=n.createDialog({name:i,width:500,title:n.lang(i),body:html,yesBtn:{name:n.lang("yes"),click:function(){var t=e.iframeDoc(d);n[l[0].checked?"html":"insertHtml"](t.body.innerHTML).hideDialog().focus()}}}),s=e("select",o.div),l=e('[name="replaceFlag"]',o.div),d=e("iframe",o.div);l[0].checked=!0,d.attr("src",t(s.val())),s.change(function(){d.attr("src",t(this.value))})})});