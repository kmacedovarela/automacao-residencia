class UsuariosController < ApplicationController
  
  before_filter :authenticate_usuario!
  
  respond_to :js
  respond_to :html, :only => :index
  
  def index
    @usuarios = Usuario.all
  end

  def show
    @usuario = Usuario.find(params[:id])
    
    if @usuario.residencias.size == 1
      redirect_to usuario_residencia_path(@usuario, @usuario.residencias.first)
    end
  end

  def new
    @usuario = Usuario.new
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    @usuario.save
  end

  def update
    @usuario = Usuario.find(params[:id])

      if @usuario.update_attributes(params[:usuario])
        redirect_to @usuario, :notice => 'Usuario was successfully updated.'
      else
        render :action => "edit"
      end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    redirect_to usuarios_url
  end
  
end
