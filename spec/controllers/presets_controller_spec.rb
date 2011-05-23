require 'spec_helper'

describe PresetsController do

  describe "GET new" do
    it "deveria listar os comodos com seus perifericos com estado falso" do
      residencia = Factory.create :residencia

      get :new, :usuario_id => residencia.usuario.id.to_s, :residencia_id => residencia.id
      comodos = assigns(:comodos)
      comodos.should_not be_nil

      comodos.each do |c|
        c.perifericos do |p|
          p.estado.should be_false
        end
      end

    end
  end

end

