/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
KindEditor.plugin("code",function(e){var t=this,n="code";t.clickToolbar(n,function(){var i=t.lang(n+"."),r=['<div style="padding:10px 20px;">','<div class="ke-dialog-row">','<select class="ke-code-type">','<option value="js">JavaScript</option>','<option value="html">HTML</option>','<option value="css">CSS</option>','<option value="php">PHP</option>','<option value="pl">Perl</option>','<option value="py">Python</option>','<option value="rb">Ruby</option>','<option value="java">Java</option>','<option value="vb">ASP/VB</option>','<option value="cpp">C/C++</option>','<option value="cs">C#</option>','<option value="xml">XML</option>','<option value="bsh">Shell</option>','<option value="">Other</option>',"</select>","</div>",'<textarea class="ke-textarea" style="width:408px;height:260px;"></textarea>',"</div>"].join(""),o=t.createDialog({name:n,width:450,title:t.lang(n),body:r,yesBtn:{name:t.lang("yes"),click:function(){var n=e(".ke-code-type",o.div).val(),r=a.val(),s=""===n?"":" lang-"+n,l='<pre class="prettyprint'+s+'">\n'+e.escape(r)+"</pre> ";return""===e.trim(r)?(alert(i.pleaseInput),a[0].focus(),void 0):(t.insertHtml(l).hideDialog().focus(),void 0)}}}),a=e("textarea",o.div);a[0].focus()})});