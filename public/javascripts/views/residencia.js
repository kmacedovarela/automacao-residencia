var residencia = {

    aplicar_mascara: function(){
        $(".cep").mask('99999-999');
    }

}

jQuery(function(){

    $("#adicionar_residencia").click(function(){
        $("#form_residencia").toggle("slow");
    });

    residencia.aplicar_mascara();

});

