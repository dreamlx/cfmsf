$(document).ready(function(){function t(t){if(t.files&&t.files[0]){var n=new FileReader;n.onload=function(t){i&&i.destroy(),$("#preview").attr("src",t.target.result),$("#preview").Jcrop({onChange:a,onSelect:a,onRelease:e,minSize:[100,100],setSelect:[0,0,231,288]},function(){i=this})},n.readAsDataURL(t.files[0])}}function a(t){$("#x1").val(t.x),$("#y1").val(t.y),$("#x2").val(t.x2),$("#y2").val(t.y2),$("#width").attr("type","text"),$("#heigth").attr("type","text"),$("#width").val(t.x2-t.x),$("#heigth").val(t.y2-t.y)}function e(){$("#x1").val(""),$("#y1").val(""),$("#x2").val(""),$("#y2").val(""),$("#width").val(""),$("heigth").val("")}$("#image_file").change(function(){t(this)});var i});