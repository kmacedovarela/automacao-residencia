jQuery(function(){
    $(".perifericos").click(function(){
        if ($(this).attr("class") == "perifericos ligado"){
            $(this).attr("class","perifericos");
            $(this).find(".estado").attr('value', 'desligado');
        }else{
            $(this).attr("class","perifericos ligado");
            $(this).find(".estado").attr('value', 'ligado');
        }

    });


    $("#submit_preset").click(function(){
        alert($("#form_cadastro_preset").serialize());

        jQuery.ajax({
			url: '/preset',
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

