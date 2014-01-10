$(document).ready(function(){
	$('.dropdown-toggle').dropdown();
	if ($(".error").eq(0).html() == "french_title 太长"){
		$("#french_form").css("display","block");
		$("#chinese_form").css("display","none");
	};
	$('.chinese_button').eq(1).click(function(){
		$("#french_form").css("display","none");
		$("#chinese_form").css("display","block");
	});
	$('.french_button').eq(0).click(function(){
		$("#chinese_form").css("display","none");
		$("#french_form").css("display","block");
	})
	$(".article_category_id").eq(0).change(function(){
        var selectedIndex = $(".article_category_id").eq(0).val();
        $(".article_category_id").eq(1).val(selectedIndex);
	})
	$(".article_category_id").eq(1).change(function(){
        var selectedIndex = $(".article_category_id").eq(1).val();
        $(".article_category_id").eq(0).val(selectedIndex);
	})
});