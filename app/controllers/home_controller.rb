class HomeController < ApplicationController

  layout 'login'

  def index
    @usuario = Usuario.new

    if current_usuario
      redireciona_usuario_pagina_inicial
    end
  end

  def suporte  	
  end

  def buscar
    if params[:tipo] == 'usuario'
      @usuarios = Usuario.com_nome_semelhante_a(params[:campo])
      @usuario = Usuario.new

      render :template => '/usuarios/index', :layout => 'application'
    end

    if params[:tipo] == 'residencia'
      @residencias = Residencia.com_endereco_semelhante_a(params[:campo])
      @residencia = Residencia.new

      render :template => '/residencias/index', :layout => 'application'
    end    
  end

end

