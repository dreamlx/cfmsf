/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("lineheight",function(e){var t=this,n="lineheight",i=t.lang(n+".");t.clickToolbar(n,function(){var r="",a=t.cmd.commonNode({"*":".line-height"});a&&(r=a.css("line-height"));var o=t.createMenu({name:n,width:150});e.each(i.lineHeight,function(n,i){e.each(i,function(e,n){o.addItem({title:n,checked:r===e,click:function(){t.cmd.toggle('<span style="line-height:'+e+';"></span>',{span:".line-height="+e}),t.updateState(),t.addBookmark(),t.hideMenu()}})})})})});