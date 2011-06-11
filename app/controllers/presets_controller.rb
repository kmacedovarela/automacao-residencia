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

    preset = Preset.new :nome => params[:nome], :residencia_id => params[:residencia_id]

    preset.estado_perifericos = to_hash ids, estados

    if preset.estado_perifericos.blank?
      flash[:error] = "Parametros inválidos."
      redirect_to new_usuario_residencia_preset_url(current_usuario,current_usuario.residencia)
    else
      preset.save
      flash[:notice] = "Preset cadastrado com sucesso."

      redirect_to "/proprietarios"
    end
  end

  def show
    @residencia = Residencia.find params[:residencia_id]
    preset = Preset.find params[:id]

    # @residencia.comodos.each do |comodo|
    #   comodo.perifericos.each do |periferico|
    #     id = periferico.id.to_s
    #     periferico.estado = (preset.estado_perifericos[id] == 'ligado') ? true : false
    #     periferico.save
    #   end
    # end

    preset.ativar!

    flash[:notice] = "Preset #{preset.nome} carregado com sucesso."
    redirect_to "/proprietarios/"
  end

  def destroy
    @preset = Preset.find(params[:id])
    @residencia = Residencia.find params[:residencia_id]

    if @preset.destroy
      flash[:notice] = 'Preset excluído com sucesso.'
    end

    redirect_to "/proprietarios/"
  end

  private

    def to_hash keys, values
      hash = "{"
      if keys.size == values.size
        keys.each_with_index do |id, i|
          hash += "'#{id}' => '#{values[i]}'"
          hash += "," if not i == keys.size-1
        end
      end
      hash += "}"

      eval(hash)
    end


end

