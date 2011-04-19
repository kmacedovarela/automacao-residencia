class Usuarios::SessionsController < Devise::SessionsController

  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  include Devise::Controllers::InternalHelpers

  # GET /login
  # def new
  #   puts 'oi'
  #   super
  # end

  # POST /login
  def create
    clean_up_passwords(build_resource)
    if usuario_signed_in?
      if current_usuario.role_administrador?
        redirect_to :usuarios
      elsif current_usuario.role_proprietario?
        redirect_to :residencias_proprietario
      end
    else
      redirect_to root_path
    end
  end

  # # GET /logout
  # def destroy
  #   puts 'destroy'
  #   super
  # end
end