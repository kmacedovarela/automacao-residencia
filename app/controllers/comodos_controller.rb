class ComodosController < ApplicationController

  respond_to :js
  respond_to :html, :only => :show

  def show
    @comodo = Comodo.find(params[:id])
  end

  def edit
    @comodo = Comodo.find(params[:id])
  end

  def create
    params[:comodo][:residencia_id] = params[:residencia_id]
    @comodo = Comodo.new(params[:comodo])

    if @comodo.save
      flash[:notice] = 'Comodo criado com sucesso'
      @comodos = Comodo.find_all_by_residencia_id @comodo.residencia.id
    end
  end

  def update
    @comodo = Comodo.find(params[:id])

    if @comodo.update_attributes(params[:comodo])
      flash[:notice] = 'Comodo atualizado com sucesso'
      @comodos = Comodo.find_all_by_residencia_id @comodo.residencia.id
    end
  end

  def destroy
    @comodo = Comodo.find(params[:id])
    if @comodo.destroy
      flash[:notice] = 'Cômodo excluída com sucesso.'
      @comodos = Comodo.find_all_by_residencia_id @comodo.residencia.id
    end
  end

end

