class PerifericosController < ApplicationController

  def show
    @periferico = Periferico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @periferico }
    end
  end

  def new
    @periferico = Periferico.new
    @periferico.comodo = Comodo.find(params[:comodo_id])
  end

  def edit
    @periferico = Periferico.find(params[:id])
  end

  def create
    params[:periferico][:comodo_id] = params[:comodo_id]
    @periferico = Periferico.new(params[:periferico])

    if @periferico.save
      flash[:notice] = 'Periferico criado com sucesso'
      redirect_to_comodo_index
    else
      render :action => "new"
    end
  end

  def update
    @periferico = Periferico.find(params[:id])

      if @periferico.update_attributes(params[:periferico])
        flash[:notice] = 'Comodo atualizado com sucesso'
        redirect_to_comodo_index
      else
        render :action => "edit"
      end
  end

  def destroy
    @periferico = Periferico.find(params[:id])
    @periferico.destroy

    redirect_to_comodo_index
  end

  private
  def redirect_to_comodo_index
    redirect_to  :controller => :comodos,
                                :action => :show,
                                :id => @periferico.comodo.id,
                                :residencia_id => @periferico.comodo.residencia.id,
                                :usuario_id => @periferico.comodo.residencia.usuario.id

  end
end

