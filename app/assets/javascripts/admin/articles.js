//= require validate

$(document).ready(function(){
	$('.dropdown-toggle').dropdown();
	if ($(".error").eq(0).html() == "french_title 太长"){
		$("#french_form").css("display","block");
		$("#chinese_form").css("display","none");

	};
	$('.chinese_button').click(function(){
		$(".french_form").css("display","none");
		$(".chinese_form").css("display","block");
        $(".chinese_button").addClass('active');
        $(".french_button").removeClass('active');
	});
	$('.french_button').click(function(){
		$(".chinese_form").css("display","none");
		$(".french_form").css("display","block");
                $(".chinese_button").removeClass('active');
        $(".french_button").addClass('active');
	})
	$(".article_category_id").eq(0).change(function(){
        var selectedIndex = $(".article_category_id").eq(0).val();
        $(".article_category_id").eq(1).val(selectedIndex);
	})
	$(".article_category_id").eq(1).change(function(){
        var selectedIndex = $(".article_category_id").eq(1).val();
        $(".article_category_id").eq(0).val(selectedIndex);
	})
	$(".ke-outline").click(function(){
      alert($(".ke-dialog-row").length)
    })

	var validator = new FormValidator('article', [{
            name: 'article[chinese_title]',
            display: 'required',    
            rules: 'required|max_length[200]'
        },{name: 'article[french_title]',
           display: 'required',
           rules: 'required|max_length[200]'
        }], function(errors) {
            if (errors.length > 0) {
                console.info(errors);
                $( ".spanerror" ).remove();
                for(var err in errors)
                {  
                	if(err == 0){
                		$("#french_form").css("display","none");
						$("#chinese_form").css("display","block");
                	}else if(err == 1){
                		$("#french_form").css("display","block");
						$("#chinese_form").css("display","none");
                	}
                    var input = $("#"+errors[err].id);
                    input.attr('value','').addClass('error').after('<span class=spanerror style="color:red; display:block; float:none" >'+errors[err].message+'</span>');
                };
            }
        });
        validator.setMessage('required','请同时填写中法文内容填必填项！');
        validator.setMessage('max_length','字符长度过长！');
});