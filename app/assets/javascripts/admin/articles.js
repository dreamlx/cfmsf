$(document).ready(function(){
	$('.dropdown-toggle').dropdown();
	$('.chinese_button').eq(1).click(function(){
		$("#franch_form").css("display","none");
		$("#chinese_form").css("display","block");
	});
	$('.franch_button').eq(0).click(function(){
		$("#chinese_form").css("display","none");
		$("#franch_form").css("display","block");
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