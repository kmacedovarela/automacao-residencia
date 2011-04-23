// esses var_applied tiveram de ser criados pois, por algum motivo, cada motivo
// recebia diversas vzs a mesma mascará e acaba ocorrendo uns comportamentos
// malucos.
// TODO: Remover essa lógica do var_applied.

var mascaras_applied = false;

var app = {

    aplicar_mascaras: function(){
        alert('s');
        if (!mascaras_applied){
            $(".telefone").live('focus', function(){
                $(this).mask('(99) 9999-9999');
            });

            $(".cpf").live('focus', function(){
                $(this).mask('999.999.999-99');
            });

            $(".cep").live('focus', function(){
                $(this).mask('99999-999');
            });

            mascaras_applied = true;
        }
    }
}

jQuery(function(){
    app.aplicar_mascaras();
});

