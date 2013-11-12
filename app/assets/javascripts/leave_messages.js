//= require validate

$(document).ready(function(){
   $("#captcha_img").after("<img src='/assets/reload.png' id='reloadCaptcha' alt='click to reload' />")
    $("#reloadCaptcha").click(function(){
        $.ajax({
                cache: true,
                type: "GET",
                url: $("#captcha_img").src,
                success: function(data) {
                    $("#captcha_img").attr("src", $("#captcha_img").attr("src"))
                }
            });
        })

        var validator = new FormValidator('leave_message', [{
            name: 'leave_message[name]',
            display: 'required',    
            rules: 'required|max_length[20]'
        }, {
            name: 'leave_message[email]',
            rules: 'required|valid_email'
        }, {
            name: 'captcha',
            rules: 'required'
        }], function(errors) {
            if (errors.length > 0) {
                console.info(errors);
                $('#new_leave_message input').removeClass('error');
                $('.formerrspan').remove();
                for(var err in errors)
                {
                    var input = $("#"+errors[err].id);
                    input.attr('value','').addClass('error').after('<span style="color:red",class=formerrspan>'+errors[err].message+'</span>');
                }
            }
        });
        validator.setMessage('required','请填必填项！');
        validator.setMessage('max_length','字符长度过长！');
        validator.setMessage('valid_email','邮箱格式错误！');

        $("#captcha").attr("placeholder","code");
    }
);





