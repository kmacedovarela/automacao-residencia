class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_permission!
    unless current_usuario.role_administrador?
      flash[:error] = "Usuário nao tem permissão para executar essa operação. Contacte o suporte"

      redireciona_usuario_pagina_inicial
    end
  end

  private

    def usuario_possui_dependencias_necessarias?
      if current_usuario.residencias.blank?
        flash[:error] = 'Usuário precisa ter pelo menos uma residência associada. Contacte o suporte'
        return false;
      end

      return true;
    end

    def redireciona_usuario_pagina_inicial
      if current_usuario.role_administrador?
        redirect_to :usuarios
      else
        if usuario_possui_dependencias_necessarias?
          @residencias = current_usuario.residencias
          @residencia = @residencias.first

          redirect_to "/proprietarios"
        else
          redirect_to "/usuarios/sign_out"
        end
      end
    end

end

