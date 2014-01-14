$(document).ready(function(){
	var ps = $(".tailcont p");
	for(var i=0; i<ps.length; i++){
		p = ps.eq(i);
		if (p.css("background-color") == "rgb(255, 255, 255)"){
			p.css("background-color", "");
		}
		if (p.css("color") == "rgb(51, 51, 51)"){
			p.css("color", "#fff")
		}
	}
})