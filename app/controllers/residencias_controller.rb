class ResidenciasController < ApplicationController

  def show
    @residencia = Residencia.find(params[:id])
    # redirect_to usuario_url(@residencia.usuario)
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
    @residencia.usuario = Usuario.find params[:usuario_id]

    if @residencia.save
      flash[:notice] = "Residencia criada com sucesso!"
      redirect_to :controller => :usuarios, :action => :show , :id => params[:usuario_id]
    else
      p @residencia.errors
      render :action => "new"
    end
  end

  def update
    @residencia = Residencia.find(params[:id])

    if @residencia.update_attributes(params[:residencia])
      flash[:notice] = "Residencia atualizada com sucesso!"
      redirect_to :controller => :usuarios, :action => :show , :id => params[:usuario_id]
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
