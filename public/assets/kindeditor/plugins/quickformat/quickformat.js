/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("quickformat",function(e){function t(e){for(var t=e.first();t&&t.first();)t=t.first();return t}var n=this,i="quickformat",a=e.toMap("blockquote,center,div,h1,h2,h3,h4,h5,h6,p");n.clickToolbar(i,function(){n.focus();for(var i,r=n.edit.doc,o=n.cmd.range,s=e(r.body).first(),l=[],d=[],c=o.createBookmark(!0);s;){i=s.next();var u=t(s);u&&"img"==u.name||(a[s.name]?(s.html(s.html().replace(/^(\s|&nbsp;|　)+/gi,"")),s.css("text-indent","2em")):d.push(s),(!i||a[i.name]||a[s.name]&&!a[i.name])&&(d.length>0&&l.push(d),d=[])),s=i}e.each(l,function(t,n){var i=e('<p style="text-indent:2em;"></p>',r);n[0].before(i),e.each(n,function(e,t){i.append(t)})}),o.moveToBookmark(c),n.addBookmark()})});