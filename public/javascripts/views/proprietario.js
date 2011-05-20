jQuery(function(){

    $(".perifericos").tipsy({gravity: 'w'});

    $(".perifericos").click(function(){
        var periferico_id = this.id;
        periferico_id = periferico_id.substring(periferico_id.indexOf('_')+1, periferico_id.length);

        jQuery.ajax({
			url: '/proprietarios/alterar_estado',
			type: 'POST',
			data: 'id='+periferico_id,
			beforeSend: function() {
				$('#periferico_'+periferico_id).html("<img src='/images/ajax-loader.gif' alt='espere por favor...' style='align: center;'></img>");
			},

			error: function(jqXHR, textStatus, errorThrown) {
			    alert('erro');
                alert(jqXHR.responseText);
			}
		});

    });

});

