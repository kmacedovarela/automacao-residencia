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
                          :estado => ["desligado", "ligado", "desligado"]

      Preset.count.should == count+1
      preset = Preset.last
      preset.nome.should == "Teste"
      preset.residencia_id.should == 1
      preset.estado_perifericos["1"].should == "desligado"
      response.should redirect_to('/proprietarios/1')
    end

  end

  describe "GET show" do
    it "deveria mandar os presets" do
      periferico = Factory.create :periferico
      residencia = periferico.comodo.residencia

      preset = Factory.create :preset, :residencia => residencia
      get :show, :usuario_id => residencia.usuario.id,
                 :residencia_id => residencia.id,
                 :id => preset.id

      residencia = assigns(:residencia)
      residencia.should_not be_nil
    end
  end

end

