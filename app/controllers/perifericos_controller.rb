class PerifericosController < ApplicationController

  before_filter :authenticate_usuario!

  respond_to :js

  def edit
    @periferico = Periferico.find(params[:id])
  end

  def create
    params[:periferico][:comodo_id] = params[:comodo_id]
    @periferico = Periferico.new(params[:periferico])

    if @periferico.save
      flash[:notice] = 'Periférico criado com sucesso.'
      @perifericos = Periferico.find_all_by_comodo_id @periferico.comodo.id
    end
  end

  def update
    @periferico = Periferico.find(params[:id])

    if @periferico.update_attributes(params[:periferico])
      flash[:notice] = 'Periférico atualizado com sucesso.'
      @perifericos = Periferico.find_all_by_comodo_id @periferico.comodo.id
    end
  end

  def destroy
    @periferico = Periferico.find(params[:id])
    if @periferico.destroy
      flash[:notice] = 'Periférico excluída com sucesso.'
      @perifericos = Periferico.find_all_by_comodo_id @periferico.comodo.id
    end
  end

end

