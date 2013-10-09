/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("plainpaste",function(e){var t=this,n="plainpaste";t.clickToolbar(n,function(){var i=t.lang(n+"."),a='<div style="padding:10px 20px;"><div style="margin-bottom:10px;">'+i.comment+"</div>"+'<textarea class="ke-textarea" style="width:408px;height:260px;"></textarea>'+"</div>",r=t.createDialog({name:n,width:450,title:t.lang(n),body:a,yesBtn:{name:t.lang("yes"),click:function(){var n=o.val();n=e.escape(n),n=n.replace(/ {2}/g," &nbsp;"),n="p"==t.newlineTag?n.replace(/^/,"<p>").replace(/$/,"</p>").replace(/\n/g,"</p><p>"):n.replace(/\n/g,"<br />$&"),t.insertHtml(n).hideDialog().focus()}}}),o=e("textarea",r.div);o[0].focus()})});