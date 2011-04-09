var usuario = {
	renderizar_form: $("#novo_usuario").click(function(e){
		e.preventDefault();
		app.requisicao_ajax({url: $(this).attr('href')});
		
		usuario.mascaras();
	}),
	
	mascaras: function(){
    $('.cpf').mask('999.999.999-99');
    $('.telefone').mask('(99) 9999-9999');
  },
}

jQuery(function(){

});