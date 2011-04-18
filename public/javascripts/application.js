// esses var_applied tiveram de ser criados pois, por algum motivo, cada motivo
// recebia diversas vzs a mesma mascará e acaba ocorrendo uns comportamentos
// malucos.
// TODO: Remover essa lógica do var_applied.

var telefone_applied = false;
$(".telefone").live('focus', function(){
	if (!telefone_applied){
	    $(this).mask('(99) 9999-9999');
	    telefone_applied = true;
	}
});

var cpf_applied = false;
$(".cpf").live('focus', function(){
	if (!cpf_applied){
	    $(this).mask('999.999.999-99');
	    cpf_applied = true;
	}
});

var cep_applied = false;
$(".cep").live('focus', function(){
	if (!cep_applied){
	    $(this).mask('99999-999');
	    cep_applied = true;
	}
});

