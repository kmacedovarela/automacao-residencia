var residencia = {

    aplicar_mascara: function(){
        $(".cep").mask('99999-999');
    }

}

jQuery(function(){
	
    residencia.aplicar_mascara();

});

