var app = {
//	// Faz sunmissao via ajax de formularios.
//	// params: form - String com o id do formulario
//	//         target - String com o id do target que será atualizado
//	//         append - Boolean que representa se o conteúdo do sucesso sera apendado ou substituido pelo data do success. (Default: false).
//	//         toggle - Boolean - Insere o efeito toogle no formulário.
//	//         clear - Apaga o formulário após sucesso. (Default: true).
//	//
//	//         Callbacks:
//	//         success_callback - Function - Funcão a ser executada depois do sucesso
//	//         error_callback - Function - Funcão a ser executada quando ocorrer um erro.
//	//         before_callback - Function - Funcão a ser executada antes de todo processamento
//	//         complete_callback - Function - Funcão a ser executada depois de todo processamento.
//	requisicao_form_ajax: function(opts){
//	
//		var submit_button = $('input[type=submit]', opts.form);
//		
//		var append = (opts.append || opts.append == true) ? opts.append : false
//		var clear = (opts.clear != null) ? opts.clear : true
//		
//		$(opts.form).submit(function(e){
//			e.preventDefault();
//			var form = $(opts.form);
//			
//			$.ajax({
//				url: form.attr('action') + '.js',
//				data: form.serialize(),
//				type: form.attr('method'),
//				
//				beforeSend: function(){
//					$(opts.ajax_load).show();
//					
//					if (opts.toggle) {
//						form.hide();
//					}
//					
//					if (opts.before_callback) {
//						opts.before_callback();
//					}
//				},
//				
//				success: function(data){
//					// Verifica se não tem mensagem de erro
//					if (data.indexOf("error_explanation") == -1) {
//						append ? $(opts.target).append(data) : $(opts.target).html(data);
//						if (clear) {
//							form[0].reset();
//						}
//					}
//					else {
//						$('#msg_error').html(data);
//						if (opts.toggle) {
//							form.show();
//						}
//						$('#msg_error').slideDown('slow').delay(3000).slideUp('slow');
//					}
//					
//					if (opts.success_callback) {
//						opts.success_callback();
//					}
//				},
//				error: function(jqXHR, textStatus, errorThrown){
//					$('#msg_error').html(jqXHR.statusText + " " + textStatus + " " + errorThrown);
//					$('#msg_error').slideDown('slow').delay(3000).slideUp('slow');
//					
//					if (opts.error_callback) {
//						opts.error_callback();
//					}
//				},
//				complete: function(){
//					$(opts.ajax_load).hide();
//					if (opts.complete_callback) {
//						opts.complete_callback();
//					}
//				}
//			});
//			
//		});
//	},
	
	// Faz requisição ajax sem formularios.
	// params: url, type, target, effect
	requisicao_ajax: function(opts){
		var type = opts.type ? opts.type : 'GET';
		var target = opts.target ? opts.target : '#conteudo_ajax';
		var effect = opts.effect ? opts.effect : true;
		
		$.ajax({
			url: opts.url,
			type: type,
			data: opts.data,
			async: false,
			
			success: function(data){
				$(target).html(data);
				if (effect) {
					$(target).slideDown();
				}
			},
			
			error: function(jqXHR, textStatus, errorThrown){
				$('#msg_error').html(jqXHR.statusText + " " + textStatus + " " + errorThrown);
				$('#msg_error').slideDown('slow').delay(3000).slideUp('slow');
			}
		});
	}
}