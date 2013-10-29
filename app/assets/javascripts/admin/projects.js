$(document).ready(function(){
	$('input.datepicker').datepicker({format: 'yyyy-mm-dd'});
	$("#image_file").change(function(){
        readURL(this);
    });

    var jcrop_api;

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                if(jcrop_api)
                {
                    jcrop_api.destroy();
                }

                $('#preview').attr('src', e.target.result);
                $('#preview').Jcrop({
                    onChange:   updateInfo,
                    onSelect:   updateInfo,
                    onRelease:  clearInfo,
                    minSize:[231,288],
                    aspectRatio:231 / 288,
                    setSelect:[0,0,231,288]

                },function(){
                    jcrop_api = this;
                });
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }
    
	function updateInfo(c)
    {
        $('#x1').val(c.x);
        $('#y1').val(c.y);
        $('#x2').val(c.x2);
        $('#y2').val(c.y2);
        $('#width').attr('type', 'text')
        $('#heigth').attr('type', 'text')
        $('#width').val(c.x2 - c.x);
        $('#heigth').val(c.y2 - c.y);
    };

    function clearInfo()
    {
        $('#x1').val("");
        $('#y1').val("");
        $('#x2').val("");
        $('#y2').val("");
        $('#width').val("");
        $('heigth').val("")
    };
})
