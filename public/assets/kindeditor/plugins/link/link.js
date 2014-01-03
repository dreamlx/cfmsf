/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("link",function(e){var t=this,n="link";t.plugin.link={edit:function(){var i=t.lang(n+"."),r='<div style="padding:20px;"><div class="ke-dialog-row"><label for="keUrl" style="width:60px;">'+i.url+"</label>"+'<input class="ke-input-text" type="text" id="keUrl" name="url" value="" style="width:260px;" /></div>'+'<div class="ke-dialog-row"">'+'<label for="keType" style="width:60px;">'+i.linkType+"</label>"+'<select id="keType" name="type"></select>'+"</div>"+"</div>",a=t.createDialog({name:n,width:450,title:t.lang(n),body:r,yesBtn:{name:t.lang("yes"),click:function(){var n=e.trim(s.val());return"http://"==n||e.invalidUrl(n)?(alert(t.lang("invalidUrl")),s[0].focus(),void 0):(t.exec("createlink",n,l.val()).hideDialog().focus(),void 0)}}}),o=a.div,s=e('input[name="url"]',o),l=e('select[name="type"]',o);s.val("http://"),l[0].options[0]=new Option(i.newWindow,"_blank"),l[0].options[1]=new Option(i.selfWindow,""),t.cmd.selection();var c=t.plugin.getSelectedLink();c&&(t.cmd.range.selectNode(c[0]),t.cmd.select(),s.val(c.attr("data-ke-src")),l.val(c.attr("target"))),s[0].focus(),s[0].select()},"delete":function(){t.exec("unlink",null)}},t.clickToolbar(n,t.plugin.link.edit)});