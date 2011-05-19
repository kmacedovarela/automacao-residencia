class CadastrosController < ApplicationController

  before_filter :authenticate_usuario!, :check_permission!

  respond_to :js

  def index
    @usuario = Usuario.new
  end

  def create_usuario
    @usuario = Usuario.new params[:usuario]
    if @usuario.save
      @residencia = Residencia.new :usuario => @usuario
    end
  end

  def create_residencia
    @residencia = Residencia.new params[:residencia]

   if @residencia.save
     @comodo = Comodo.new :residencia => @residencia
   end

   p @residencia.errors
 end

 def create_comodo
   @comodo = Comodo.new params[:comodo]

   if @comodo.save
     @periferico = Periferico.new :comodo => @comodo
   end
 end

 def create_periferico
   @periferico = Periferico.new params[:periferico]

   @periferico.save
 end
end

