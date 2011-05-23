class PresetsController < ApplicationController

  def new
    residencia = Residencia.find params[:residencia_id]

    @comodos = residencia.comodos
  end

end

