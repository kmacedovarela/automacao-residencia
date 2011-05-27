class PresetsController < ApplicationController

  def new
    @residencia = Residencia.find params[:residencia_id]
    @usuario = @residencia.usuario

    @residencias = @usuario.residencias

    @comodos = @residencia.comodos

    @comodos.each do |c|
      c.perifericos.each do |p|
        p.estado = false
      end
    end

    @preset = Preset.new
  end

  def create

    ids = params[:id]
    estados = params[:estado]

    preset = Preset.new :nome => params[:nome]

    preset.estado_perifericos = to_hash ids, estados

    if preset.estado_perifericos.blank?
      flash[:error] = "Parametros inválidos."
      redirect_to new_usuario_residencia_preset_url(current_usuario,current_usuario.residencia)
    else
      preset.save
      flash[:notice] = "Preset cadastrado com sucesso."

      redirect_to "/proprietarios/#{params[:residencia_id]}"
    end
  end

  private

    def to_hash keys, values
      hash = "{"
      if keys.size == values.size
        keys.each_with_index do |id, i|
          hash += "':#{id}' => '#{values[i]}'"
          hash += "," if not i == keys.size-1
        end
      end
      hash += "}"

      eval(hash)
    end

end

