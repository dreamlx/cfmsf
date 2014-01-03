/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("anchor",function(e){var t=this,n="anchor",i=t.lang(n+".");t.plugin.anchor={edit:function(){var r=['<div style="padding:20px;">','<div class="ke-dialog-row">','<label for="keName">'+i.name+"</label>",'<input class="ke-input-text" type="text" id="keName" name="name" value="" style="width:100px;" />',"</div>","</div>"].join(""),o=t.createDialog({name:n,width:300,title:t.lang(n),body:r,yesBtn:{name:t.lang("yes"),click:function(){t.insertHtml('<a name="'+s.val()+'">').hideDialog().focus()}}}),a=o.div,s=e('input[name="name"]',a),l=t.plugin.getSelectedAnchor();l&&s.val(unescape(l.attr("data-ke-name"))),s[0].focus(),s[0].select()},"delete":function(){t.plugin.getSelectedAnchor().remove()}},t.clickToolbar(n,t.plugin.anchor.edit)});