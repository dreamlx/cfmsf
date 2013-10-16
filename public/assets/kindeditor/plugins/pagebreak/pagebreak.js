/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("pagebreak",function(e){var t=this,n="pagebreak",i=e.undef(t.pagebreakHtml,'<hr style="page-break-after: always;" class="ke-pagebreak" />');t.clickToolbar(n,function(){var n=t.cmd,a=n.range;t.focus(),a.enlarge(!0),n.split(!0);var r="br"==t.newlineTag||e.WEBKIT?"":'<p id="__kindeditor_tail_tag__"></p>';if(t.insertHtml(i+r),""!==r){var o=e("#__kindeditor_tail_tag__",t.edit.doc);a.selectNodeContents(o[0]),o.removeAttr("id"),n.select()}})});