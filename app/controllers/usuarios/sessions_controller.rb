class Usuarios::SessionsController < Devise::SessionsController

  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  include Devise::Controllers::InternalHelpers

  # GET /login
  def new
    flash[:notice] = 'Você não possui privilégios para acessar está página, efetue login.'
    redirect_to root_path
  end

  # POST /login
  def create
    clean_up_passwords(build_resource)

    if usuario_signed_in?
      redireciona_usuario_pagina_inicial
    else
      flash[:error] = 'Usuário ou senha inválidos.'
      redirect_to root_path
    end
  end

end

