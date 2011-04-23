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
    if @usuario.save
      flash[:notice] = 'Usuário criado com sucesso.'
    end

    puts @usuario.errors.full_messages.size
  end

  def update
    @usuario = Usuario.find(params[:id])

      if @usuario.update_attributes(params[:usuario])
        redirect_to @usuario, :notice => 'Usuário atualizado com sucesso.'
      else
        render :action => "edit"
      end
  end

  def destroy
    @usuario = Usuario.find(params[:id])

    if @usuario.destroy
      flash[:notice] = 'Usuário deletado com sucesso.'
    end

    redirect_to usuarios_url
  end

end

