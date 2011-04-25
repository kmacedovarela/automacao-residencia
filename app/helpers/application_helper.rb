module ApplicationHelper
  def link_voltar path
    img = image_tag(
        "/images/seta_esquerda.png",
        :title => "Voltar",
        :class => "voltar"
     )

   link_to img, path
  end

  def link_editar path
     img = image_tag(
         "/images/caneta.png",
         :size => '16x16',
         :title => "Editar",
         :class => "icone"
      )

    link_to img, path, :remote => true
  end

  def link_excluir path
     img = image_tag(
         "/images/menos.png",
         :size => '16x16',
         :title => "icone",
         :class => "icone"
      )

    link_to img, path, :remote => true, :confirm => 'Você tem certeza?', :method => :delete
  end

  def link_visualizar path
     img = image_tag(
         "/images/lupa.png",
         :size => '16x16',
         :title => "Adicionar",
         :class => "icone"
      )

    link_to img, path
  end
  
  
  # ################## 
  #  parametros:
  # => entidade processada; ex: @usuario, 
  # => a coleção que será utilizada para renderizar a listagem; ex: @usuarios,
  # => partial que será adicionada a listagem; ex: 'usuario'
  # => listagem que será atualizada; ex: '#listagem_usuario' 
  # 
  # As variaveis partial e lista_destino recebem como valor default, nomes semelhantes ao da entidade. 
  # => partial = 'classe_entidade'  
  # => lista_destino = '#listagem_classe_entidade' 
  # 
  # ##################
  def renderizar_resultado_js entidade, colecao , partial = '', lista_destino = ''
    partial = entidade.class.name.downcase if partial.blank?
    lista_destino = "#listagem_#{entidade.class.name.downcase}" if lista_destino.blank?
    
    js = ""
    
    if entidade.errors.any?
      js << %Q{
                $('#notice').hide();
                $('#error').html('');
                $('#error').append('<ul>');
            }
      entidade.errors.full_messages.each { |msg| adicionar_erro(js,msg) }
      js << %Q{        
                $('#error').append('</ul>');
                $('#error').show();
            }      
    else
      js << %Q{
        $('#error').hide();
        $('#notice').html('#{escape_javascript(flash[:notice])}');  

        $(':input:not(input[type=submit])').val('');
        $('form').parent().slideUp();

        $('#notice').show();
        $('#{lista_destino}').html('#{escape_javascript( render :partial => partial, :collection => colecao )}');










      }      
    end
    
    js.html_safe
  end
  
  private
  def adicionar_erro js, msg
    js << "$('#error').append('<li> #{escape_javascript(msg)} </li>'); "
  end
end

