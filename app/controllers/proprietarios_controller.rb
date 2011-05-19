class ProprietariosController < ApplicationController

  def index
    @usuario = current_usuario
    @residencia = @usuario.residencias.first
  end

end

