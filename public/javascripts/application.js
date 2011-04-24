//TODO: O live está reaplicando a mascara de telefone, sempre que o campo ganha foco. wtf?

var mascaras_applied = false;

var app = {

	aplicar_mascaras: function(){
		var telefone = $('.telefone');
		var cpf = $('.cpf');
		var cep = $('.cep');
											
    if (getEventos(telefone, 'focus') == undefined ){	
			$('.telefone').live('focus', function(){
				$(this).mask('(99) 9999-9999');
			});
		}

	    // $(".cpf").live('focus', function(){
	    //       	$(this).mask('999.999.999-99');
	    // });
	    // 
	    // $(".cep").live('focus', function(){
	    // 	$(this).mask('99999-999');
	    // });
	    // 
	    // mascaras_applied = true;
	}
}

jQuery(function(){
    app.aplicar_mascaras();
});

function getEventos(elemento, evento){
	return elemento.data('events')
}