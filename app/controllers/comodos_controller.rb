class ComodosController < ApplicationController

  def show
    @comodo = Comodo.find(params[:id])
  end

  def new
    @comodo = Comodo.new
  end

  def edit
    @comodo = Comodo.find(params[:id])
  end

  def create
    @comodo = Comodo.new(params[:comodo])

    if @comodo.save
      redirect_to(@comodo, :notice => 'Comodo criado com sucesso') 
    else
      render :action => "new" 
    end
  end

  def update
    @comodo = Comodo.find(params[:id])

    if @comodo.update_attributes(params[:comodo])
      redirect_to(@comodo, :notice => 'Comodo was successfully updated.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @comodo = Comodo.find(params[:id])
    @comodo.destroy

    redirect_to(comodos_url) 
  end
end
