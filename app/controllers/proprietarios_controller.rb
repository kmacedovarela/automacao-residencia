class ProprietariosController < ApplicationController

  before_filter :authenticate_usuario!

  respond_to :js
  respond_to :html, :only => :index

  def index
    @usuario = current_usuario
    @residencia = @usuario.residencias.first
  end

  def alterar_estado
    @periferico = Periferico.find params[:id]
    @periferico.estado = !@periferico.estado

    @periferico.save
  end

end

