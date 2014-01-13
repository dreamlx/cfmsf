//= require validate

$(document).ready(function(){
    var role = $("#user_role").val();
    if(role == "admin"){
      $("#editor_permission").css("display", "none");
    }
	$("#user_role").change(function(){
		var role = $("#user_role").val(); 
		if (role == "admin"){
			$("#editor_permission").css("display", "none");
		}else if (role == "editor"){
			$("#editor_permission").css("display", "block");
		}
	})

	var validator = new FormValidator('user', [{
            name: 'user[username]',
            display: 'required',    
            rules: 'required|max_length[10]|min_length[4]'
        }], function(errors) {
            if (errors.length > 0) {
                console.info(errors);
                $('#new_user input').removeClass('error');
                $( ".spanerror" ).remove();
                for(var err in errors)
                {
                    var input = $("#"+errors[err].id);
                    input.attr('value','').addClass('error').after('<span class=spanerror style="color:red; float:none" >'+errors[err].message+'</span>');
                };
            }
        });
        validator.setMessage('required','请填必填项！');
        validator.setMessage('min_length','字符长度过短');
        validator.setMessage('max_length','字符长度过长！');
});
