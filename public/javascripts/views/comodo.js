var comodo = {
	novo: function(){
		$("#novo_comodo").click(function(){
			$("#comodos_container").append("<div class='comodo'></div>");
			//$("#comodos_container .comodo:last").draggable();
		});
	}
}

jQuery(function(){
	
	$("#comodos_container").droppable({
	});
	comodo.novo();
	
});