$(".telefone").live('focus', function(){
	$(this).mask('(99) 9999-9999');
});

$(".cpf").live('focus', function(){
	$(this).mask('999.999.999-99');
});

$(".cep").live('focus', function(){
	$(this).mask('99999-999');
});
