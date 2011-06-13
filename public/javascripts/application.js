var app = {

    selecionar_menu: function(id){
        $("div.nav ul#"+id).attr("class","select current");
    },
		
		setup_botao_busca: function(){
			var campo_busca = $("#campo_busca");
			campo_busca.blur(function(){
				if (this.value=='') { this.value='Buscar'; }
			}); 
			
			campo_busca.focus(function(){
				if (this.value=='Buscar') { this.value=''; }
			});

			$('.styledselect').selectbox({ inputClass: "selectbox_styled" });
		},

    close_message: function(){
      $(".close_message").click(function(){
        $("#notice").hide();
      });
    }

}

$(document).ready(function(){
    $(document).pngFix( );
		app.setup_botao_busca();
    app.close_message();
});

