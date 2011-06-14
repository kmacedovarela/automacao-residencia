var login = {
	comportamento_mensagens: function(id){
		if ($(id).html().trim() != ""){
			$(id).show();
		}else{
			$(id).hide();
		}

		$(id).click(function(){
			$(id).slideUp();
		});	
	}

}

jQuery(function(){
	$('#usuario_email').focus();

	login.comportamento_mensagens("#loginbox_error");
	login.comportamento_mensagens("#loginbox_alert");

});

