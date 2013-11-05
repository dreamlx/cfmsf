/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("preview",function(e){var t=this,n="preview";t.clickToolbar(n,function(){var i=(t.lang(n+"."),'<div style="padding:10px 20px;"><iframe class="ke-textarea" frameborder="0" style="width:708px;height:400px;"></iframe></div>'),r=t.createDialog({name:n,width:750,title:t.lang(n),body:i}),a=e("iframe",r.div),o=e.iframeDoc(a);o.open(),o.write(t.fullHtml()),o.close(),e(o.body).css("background-color","#FFF"),a[0].contentWindow.focus()})});