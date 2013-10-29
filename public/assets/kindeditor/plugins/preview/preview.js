/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("preview",function(e){var t=this,n="preview";t.clickToolbar(n,function(){var i=(t.lang(n+"."),'<div style="padding:10px 20px;"><iframe class="ke-textarea" frameborder="0" style="width:708px;height:400px;"></iframe></div>'),a=t.createDialog({name:n,width:750,title:t.lang(n),body:i}),r=e("iframe",a.div),o=e.iframeDoc(r);o.open(),o.write(t.fullHtml()),o.close(),e(o.body).css("background-color","#FFF"),r[0].contentWindow.focus()})});