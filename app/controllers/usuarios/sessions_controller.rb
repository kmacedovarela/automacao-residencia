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
      if current_usuario.role_administrador?
        redirect_to :usuarios
      else
        puts 'entrei no else'
        valida_dependencias_usuario
        puts flash[:error]
        if flash[:error].nil?
          puts 'ENTREI NESSA POXA!'
          @residencias = current_usuario.residencias
          @residencia = @residencias.first


          puts 'vo RENDERIZA O TEMPLATE'
          render :template => "/residencias/index_proprietario"
        else
          puts 'redirect root_path'
          redirect_to root_path
        end
      end
    else
      flash[:error] = 'Usuário ou senha inválidos.'
      redirect_to root_path
    end
  end

  private

    def valida_dependencias_usuario
      if current_usuario.residencias.blank?
        flash[:error] = 'Usuário precisa ter pelo menos uma residência associada. Contacte o suporte'
 #     elsif current_usuario.residencias.comodos.blank?
 #       flash[:error] = 'Não existem comodos cadastrados para esta residencia. Contacte o suporte'
 #     elsif current_usuario.residencias.comodos.perifericos.blank?
 #       flash[:error] = 'Não existem perifericos cadastrados para esta residencia. Contacte o suporte'
      end
    end

end

