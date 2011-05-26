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


  describe "POST create" do
    it 'deveria cadastrar um preset' do
      count = Preset.count

      xhr :post, :create, :nome => "Teste",
                          :usuario_id => "5",
                          :residencia_id => "1",
                          :id => ["1", "2", "3"],
                          :estado => ["false", "true", "false"]

      Preset.count.should == count+1
      response.should redirect_to('/proprietarios/1')
    end

  end

end

