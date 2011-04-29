var usuario = {

    aplicar_mascara: function(){
        $(".telefone").mask('(99) 9999-9999');
        $(".cpf").mask('999.999.999-99');
    }

}

jQuery(function(){
	acao_botao_hide_form('', '#form_usuario');
	usuario.aplicar_mascara();
});

