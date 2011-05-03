var app = {

    selecionar_menu: function(id){
        $("div.nav ul#"+id).attr("class","select current");
    },
		
		setup_botao_busca: function(){
			var campo_busca = $("#campo_busca_home");
			campo_busca.blur(function(){
				if (this.value=='') { this.value='Buscar'; }
			}); 
			
			campo_busca.focus(function(){
				if (this.value=='Buscar') { this.value=''; }
			});
		}

}

$(document).ready(function(){
    $(document).pngFix( );
		app.setup_botao_busca();
});

