require(["jquery"]
    ,function($,salvattore){
        $("#captcha_img").click(function(){
        $.ajax({
                cache: true,
                type: "GET",
                url: $("#captcha_img").src,
                success: function(data) {
                    $("#captcha_img").attr("src", $("#captcha_img").attr("src"))
                }
            });
        })
    }
);