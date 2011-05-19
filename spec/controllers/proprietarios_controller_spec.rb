require 'spec_helper'
include Devise::TestHelpers


describe ProprietariosController do

  before do
    @usuario = Factory :usuario

    sign_in @usuario
  end

  it 'deveria conter @usuario com residencia, comodo e periferico' do
    periferico = Factory.create :periferico
    sign_in periferico.comodo.residencia.usuario

    get :index

    usuario = assigns(:usuario)
    usuario.should_not be_nil
    usuario.residencias.should_not be_blank
    usuario.residencias[0].comodos.should_not be_blank
    usuario.residencias[0].comodos[0].should_not be_blank
  end

  it 'deveria alterar o estado do periferico em questao' do
    periferico = Factory.create :periferico

    periferico.estado.should be_false
    post :alterar_estado, {:id => periferico.id.to_s}
    assigns(:periferico).estado.should be_true

  end

end

