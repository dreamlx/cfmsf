$(document).ready(function(){
	$("#user_role").change(function(){
		var role = $("#user_role").val(); 
		if (role == "admin"){
			$("#editor_permission").css("display", "none");
		}else if (role == "editor"){
			$("#editor_permission").css("display", "block");
		}

	})
});