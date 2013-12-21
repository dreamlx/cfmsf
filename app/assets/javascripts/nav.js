$(document).ready(function(){
	$("#navToggle").click(function(e){
		$("#mobileNav").slideToggle(200);
	});
	$("#projectTagListBtn").click(function(e){
		$("span.expendArrow").toggleClass("rotateArrow");
		$("ul#mobileNavProjectTagList").slideToggle(200,function(){
			if($("ul#mobileNavProjectTagList").css("display") === "block")
			{
				if(!$("ul#mobileNavProjectTagList").hasClass("DataLoaded"))
				{
					$.get("/tags.json",function(data)
					{
						data.forEach(buildTagList);
						$("ul#mobileNavProjectTagList").addClass("DataLoaded");
						$("ul#mobileNavProjectTagList").find(".tagAllCount").text(tagCounts);
						
						// http://localhost:3000/tags/6/projects
					})
				}
			}
		});
		
		e.preventDefault();
	});
});

var tagCounts=0;
var mql = window.matchMedia("screen and (min-width:1080px)");

mql.addListener(function(mql) {
	// console.log("media change!!");
	$("#mobileNav").hide();
});

function buildTagList(element, index, array)
{
	var li = $("<li><a href=''><span></span></a></li>");
	li.find("a").attr("href","/tags/"+element.id+"/projects").append(element.name).find("span").text(element.count);
	tagCounts+=element.count;

	$("ul#mobileNavProjectTagList").append(li);
}