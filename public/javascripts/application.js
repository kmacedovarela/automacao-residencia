function acao_botao_hide_form(botao_id, form_id){
	if (botao_id == '') {
		botao_id = '#adicionar';
	}
	
	$(botao_id).click(function(e){
		// if($(form_id).find('form').size > 0){ // esconde apenas se o form ja estiver na tela
			e.preventDefault(); // TODO !!!
			//- Ele esta submetendo pro new e renderizando o form de novo. 
			// Ele deveria apenas esconder, caso ja exista e seja um form de create
			// Deveria renderizar o new, caso seja um form de edit
			$(form_id).hide("slow");
		 	// Limpa o formulário
			$(":input:not(input[type=submit])").val("");
		// }
	});
}