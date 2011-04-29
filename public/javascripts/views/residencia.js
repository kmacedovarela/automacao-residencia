var residencia = {
    aplicar_mascara: function(){
        $(".cep").mask('99999-999');
    }

}

jQuery(function(){
		acao_botao_hide_form('', '#form_residencia');
    residencia.aplicar_mascara();
});

