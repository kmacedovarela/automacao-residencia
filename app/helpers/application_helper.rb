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
end

