var usuario = {

    aplicar_mascara: function(){
        $(".telefone").mask('(99) 9999-9999');
        $(".cpf").mask('999.999.999-99');
    }

}

jQuery(function(){
	usuario.aplicar_mascara();

	app.selecionar_menu("menu_usuario");
});

