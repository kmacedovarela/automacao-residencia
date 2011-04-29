var usuario = {

    aplicar_mascara: function(){
        $(".telefone").mask('(99) 9999-9999');
        $(".cpf").mask('999.999.999-99');
    }

}

jQuery(function(){
	$("#adicionar").click(function(){
	    $("#form_usuario").toggle("slow");

	    // Limpa o formulário
	    $(":input:not(input[type=submit])").val("");
	    $("#password_field").show();
	});

	usuario.aplicar_mascara();
});

