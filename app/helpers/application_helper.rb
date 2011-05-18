module ApplicationHelper
  def link_voltar path
    img = image_tag(
        "/images/seta_esquerda.png",
        :title => "Voltar",
        :class => "voltar"
     )

   link_to img, path
  end

  def link_novo path, texto = ''
    #texto = %{	<span class="toolbar-button" id='adicionar' > Adicionar </span> }.html_safe if texto.blank?
    texto = %{	<img src="/images/add.png" id='adicionar' > </img> }.html_safe if texto.blank?
    link_to texto, path, :remote => true
  end

  def link_editar path
    link_to ' ', path, :remote => true, :class => "icon-1 info-tooltip", :title => "Editar"
  end

  def link_excluir path
    link_to ' ', path, :remote => true,
                  :confirm => 'Você tem certeza?',
                  :method => :delete,
                  :class => 'icon-2 info-tooltip',
                  :title => 'Excluir'
  end

  def link_visualizar path
    link_to ' ', path, :class => 'icon-3 info-tooltip', :title => 'Visualizar'
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
  def renderizar_create_update_js entidade, colecao , partial = '', lista_destino = ''
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
        $('#notice').html("#{escape_javascript(image_tag "/images/table/icon_close_green.gif", :title => "fechar mensagens", :class => "close_message" )}");
        $('#notice').append('#{escape_javascript(flash[:notice])}');

        $(':input:not(input[type=submit])').val('');
        $('form').parent().slideUp();

        $('#notice').show();
        $('#{lista_destino}').html('#{escape_javascript( render :partial => partial, :collection => colecao )}');
        $('#{lista_destino}').parent().show();
      }
    end

    js.html_safe
  end

  # ##################
  #  parametros:
  # => a coleção que será utilizada para renderizar a listagem; ex: @usuarios,
  # => partial que será adicionada a listagem; ex: 'usuario'
  # => listagem que será atualizada; ex: '#listagem_usuario'
  #
  # As variaveis partial e lista_destino recebem como valor default, nomes semelhantes ao da entidade.
  # => partial = 'classe_entidade'
  # => lista_destino = '#listagem_classe_entidade'
  #
  # ##################
  def renderizar_destroy_js colecao , partial = '', lista_destino = ''
    partial = colecao.first.class.name.downcase if partial.blank?
    lista_destino = "#listagem_#{colecao.first.class.name.downcase}" if lista_destino.blank?

    js = %Q{
      $('#error').hide();
      $('#notice').html('#{escape_javascript(flash[:notice])}');
      $('#notice').show();
      $('#{lista_destino}').html('#{ escape_javascript( render :partial => partial, :collection => colecao) }');
    }

    js.html_safe
  end

  def show_form form_id, form_partial = "form"
    js = %Q{
      $('#{form_id}').html('#{ escape_javascript( render :partial => form_partial ) }');
      $('#{form_id}').slideDown();
    }

    js.html_safe
  end

  def cancelar_form form_id
    js = %Q{
      $(".cancelar_form").click(function(e){
        e.preventDefault();
        $("#{form_id}").html("");
      });
    }

    js.html_safe
  end

  private
  def adicionar_erro js, msg
    js << "$('#error').append('<li> #{escape_javascript(msg)} </li>'); "
  end

end

