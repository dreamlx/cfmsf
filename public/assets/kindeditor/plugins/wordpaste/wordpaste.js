/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("wordpaste",function(e){var t=this,n="wordpaste";t.clickToolbar(n,function(){var i=t.lang(n+"."),r='<div style="padding:10px 20px;"><div style="margin-bottom:10px;">'+i.comment+"</div>"+'<iframe class="ke-textarea" frameborder="0" style="width:408px;height:260px;"></iframe>'+"</div>",a=t.createDialog({name:n,width:450,title:t.lang(n),body:r,yesBtn:{name:t.lang("yes"),click:function(){var n=l.body.innerHTML;n=e.clearMsWord(n,t.filterMode?t.htmlTags:e.options.htmlTags),t.insertHtml(n).hideDialog().focus()}}}),o=a.div,s=e("iframe",o),l=e.iframeDoc(s);e.IE||(l.designMode="on"),l.open(),l.write("<!doctype html><html><head><title>WordPaste</title></head>"),l.write('<body style="background-color:#FFF;font-size:12px;margin:2px;">'),e.IE||l.write("<br />"),l.write("</body></html>"),l.close(),e.IE&&(l.body.contentEditable="true"),s[0].contentWindow.focus()})});