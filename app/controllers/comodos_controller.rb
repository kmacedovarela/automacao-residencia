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
    params[:comodo][:residencia_id] = params[:residencia_id]
    @comodo = Comodo.new(params[:comodo])

    if @comodo.save
      flash[:notice] = 'Comodo criado com sucesso'
      redirect_to_residencia_index
    else
      render :action => "new" 
    end
  end

  def update
    @comodo = Comodo.find(params[:id])
  
    if @comodo.update_attributes(params[:comodo])
      flash[:notice] = 'Comodo atualizado com sucesso'
      redirect_to_residencia_index
    else
      render :action => "edit" 
    end
  end

  def destroy
    @comodo = Comodo.find(params[:id])
    @comodo.destroy
    redirect_to_residencia_index
  end
  
  private
  def redirect_to_residencia_index 
    redirect_to  :controller => :residencias, 
                                :action => :show,
                                :id => @comodo.residencia.id,
                                :usuario_id => @comodo.residencia.usuario.id
    
  end
end
