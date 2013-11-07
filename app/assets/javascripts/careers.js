$("document").ready(function(){
	$(".onePeople").mouseenter(function(e){
		var id = $(e.currentTarget).attr("id");
		id = id.substr(7);
		update(id);
		
		// console.log(id);
	})
	update(1);
})


function update(id)
{
	$("#peoplesayContent h1").hide();
	$("#words_"+id).show();

	$("#peoplesayContent").removeClass();
	$("#peoplesayContent").addClass("peoplesay_"+id);
}