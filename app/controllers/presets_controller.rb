class PresetsController < ApplicationController

  def new
    @residencia = Residencia.find params[:residencia_id]
    @usuario = @residencia.usuario

    @residencias = @usuario.residencias

    @comodos = @residencia.comodos

    @comodos.each do |c|
      c.perifericos.each do |p|
        p.estado = false;
      end
    end

    @preset = Preset.new
  end

  def create
    ids = params[:id]
    estados = params[:estado]

    Preset.new :residencia =>

    redirect_to "/proprietarios/#{params[:residencia_id]}"
  end

end

