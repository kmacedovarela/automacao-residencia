class HomeController < ApplicationController

  layout 'login'

  def index
    @usuario = Usuario.new

    if current_usuario
      redireciona_usuario_pagina_inicial
    end
  end

end

