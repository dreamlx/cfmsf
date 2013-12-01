$(document).ready(function(){
	$("#navToggle").click(function(e){
		$("#mobileNav").slideToggle();
	});
	$("#projectTagListBtn").click(function(e){
		$("span.expendArrow").toggleClass("rotateArrow");
		$("ul#mobileNavProjectTagList").slideToggle();
		e.preventDefault();
	});
});

var mql = window.matchMedia("screen and (min-width:1080px)");

mql.addListener(function(mql) {
	// console.log("media change!!");
	$("#mobileNav").hide();
});