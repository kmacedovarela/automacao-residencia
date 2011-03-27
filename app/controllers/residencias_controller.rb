class ResidenciasController < ApplicationController

  def index
    @residencias = Residencia.all
  end

  def show
    @residencia = Residencia.find(params[:id])
  end

  def new
    @residencia = Residencia.new
    @residencia.usuario = Usuario.find params[:usuario_id]
  end

  def edit
    @residencia = Residencia.find(params[:id])
  end

  def create
    @residencia = Residencia.new(params[:residencia])

    if @residencia.save
      flash[:notice] = "Usuario criado com sucesso!"
      redirect_to :action => :index , :usuario_id => params[:usuario_id]
    else
      render :action => "new"
    end
  end

  def update
    @residencia = Residencia.find(params[:id])

    if @residencia.update_attributes(params[:residencia])
      flash[:notice] = "Usuario atualizado com sucesso!"
      redirect_to :action => :show , :id => @residencia.id, :usuario_id => params[:usuario_id]
    else
      render :action => "edit"
    end
  end

  def destroy
    @residencia = Residencia.find(params[:id])
    @residencia.destroy

    redirect_to usuario_residencias_url
  end
end
