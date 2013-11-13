var projectTags;
var tagList = [];

$(document).ready(function(){
	


    
    get_tags();
  
    $('#addTagInput').autocomplete({
        lookup: tagList
    });

    projectTags = $("input#life_tag_list").val().split(",");
    projectTags.forEach(trimSpace)
    for(var tag in projectTags)
    {
    	$("#tag_list").append("<li><b>"+projectTags[tag]+"</b><a href='#'>X</a></li>");
    }

    if(projectTags.length > 0)
    {
    	$("#tag_list li a").click(delTag);
    }

    $("#addTagBtn").mousedown(function(e){
    	var v = $("#addTagInput").val();
    	if(v.length < 1)
    	{
			return
    	}
    	if(projectTags.indexOf(v) > -1)
    	{
    		alert("tag "+v+" already exist");
    		return
    	}
    	if(v.indexOf(",")>0)
    	{
    		alert("no comma");
    		return;
    	}
    	console.log(v);
    	projectTags.push(v);

    	var delBtn = $("<a href='#'>X</a>").click(delTag);
    	var tag = $("<li><b>"+v+"</b></li>").append(delBtn);
    	$("#tag_list").append(tag);
    	$("#addTagInput").val("");
    	e.preventDefault();
    });

    $("#addTagInput").keydown(function(e){
    	if(e.keyCode == 13)
    	{
    		e.preventDefault();
    	}
    });

    $("form.edit_life").submit(function(){
    	var tags = projectTags.join(",");
    	$("input#life_tag_list").val(tags);
    });
    
});


function get_tags(){
    $.ajax({	
        cache: true,
        type: "GET",
        dataType:"json",
        async: false,
        url: "/tags/auto_complete_tag",
        success: function(data) {
            tagList = data
        }
    });
}
function trimSpace(element, index, array)
{
	array[index] = element.trim();
}

var delTag = function(e)
{
	var tag = $(this).parent().find("b").text();
	$(this).parent().remove();

	var index = projectTags.indexOf(tag)
	projectTags.splice(index,1);
	e.preventDefault();	
}