jQuery(function(){

    $("#adicionar_usuario").click(function(){
        $("#form_usuario").toggle("slow");
        // Limpa o formulário
        $(":input:not(input[type=submit])").val("");
        $("#password_field").show();
    });

});

