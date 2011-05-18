class ResidenciasController < ApplicationController

  before_filter :authenticate_usuario!, :check_permission!

  respond_to :js

  def show
    @residencia = Residencia.find(params[:id])
    @comodo = Comodo.new
    @comodo.residencia = @residencia
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
      flash[:notice] = "Residência criada com sucesso!"
      @residencias = Residencia.find_all_by_usuario_id(params[:usuario_id])
    end
  end

  def update
    @residencia = Residencia.find(params[:id])

    if @residencia.update_attributes(params[:residencia])
      flash[:notice] = "Residência atualizada com sucesso!"
      @residencias = Residencia.find_all_by_usuario_id(params[:usuario_id])
    end
  end

  def destroy
    @residencia = Residencia.find(params[:id])
    if @residencia.destroy
      flash[:notice] = 'Residência excluída com sucesso.'
      @residencias = Residencia.find_all_by_usuario_id(params[:usuario_id])
    end
  end
end

