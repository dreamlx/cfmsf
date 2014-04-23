// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bxslider

$(document).ready(function(){
  $('.bxslider').bxSlider();
  CheckSizeZoom();
   //$('body').css('zoom', ' ' + 160 + '%');
   
});
$(window).resize(function(){
  CheckSizeZoom();
});
function CheckSizeZoom() {
  var minW = 780;

  if ($(window).width() > minW) {
    var zoomLev = $(window).width() / minW;

    if (typeof (document.body.style.zoom) != "undefined") {
      $(document.body).css('zoom', zoomLev);
    }else {
      // Mozilla doesn't support zoom, use -moz-transform to scale and compensate for lost width
      $('#divWrap').css('-moz-transform', "scale(" + zoomLev + ")");
      $('#divWrap').width($(window).width() / zoomLev + 10);
      $('#divWrap').css('position', 'relative');
      $('#divWrap').css('left', (($(window).width() - minW - 16) / 2) + "px");
      $('#divWrap').css('top', "1px");
      $('#divWrap').css('position', 'relative');
    }
  }else {
    $(document.body).css('zoom', '');
    $('#divWrap').css('position', '');
    $('#divWrap').css('left', "");
    $('#divWrap').css('top', "");
    $('#divWrap').css('-moz-transform', "");
    $('#divWrap').width("");
  }
}