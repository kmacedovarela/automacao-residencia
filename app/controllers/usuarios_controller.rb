class UsuariosController < ApplicationController

  before_filter :authenticate_usuario!

  respond_to :js
  respond_to :html, :only => :index

  def index
    @usuarios = Usuario.all
    @usuario = Usuario.new
  end

  def show
    @usuario = Usuario.find(params[:id])
    @residencia = Residencia.new

    if @usuario.residencias.size == 1
      redirect_to usuario_residencia_path(@usuario, @usuario.residencias.first)
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      flash[:notice] = 'Usuário criado com sucesso.'
      @usuarios = Usuario.all
    end
  end

  def update
    @usuario = Usuario.find(params[:id])

    if @usuario.update_attributes(params[:usuario])
      flash[:notice] = 'Usuário atualizado com sucesso.'
      @usuarios = Usuario.all
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])

    if @usuario.destroy
      flash[:notice] = 'Usuário excluído com sucesso.'
      @usuarios = Usuario.all
    end
  end

end

