require 'spec_helper'
include Devise::TestHelpers


describe ProprietariosController do

  before do
    @periferico = Factory.create :periferico
    sign_in @periferico.comodo.residencia.usuario

  end

  it 'deveria conter @usuario com residencia, comodo e periferico' do
    get :index

    usuario = assigns(:usuario)
    usuario.should_not be_nil
    usuario.residencias.should_not be_blank
    usuario.residencias[0].comodos.should_not be_blank
    usuario.residencias[0].comodos[0].should_not be_blank
  end

  it 'deveria alterar o estado do periferico em questao' do
    @periferico.estado.should be_false
    xhr :post, :alterar_estado, {:id => @periferico.id.to_s}
    assigns(:periferico).estado.should be_true
  end

  it 'deveria considerar a residencia em que o id eh passado como parametro' do
    usuario = Factory.create :usuario
    residencia = Factory.create :residencia, :usuario_id => usuario.id
    residencia2 = Factory.create :residencia, :usuario_id => usuario.id

    sign_out @periferico.comodo.residencia.usuario
    sign_in usuario

    get :index, :id => residencia2.id
    assigns(:residencia).should == residencia2
  end

  it 'um usuário x não pode ver a residencia do outro' do
    usuario1 = Factory.create :usuario
    residencia1 = Factory.create :residencia, :usuario_id => usuario1.id

    usuario2 = Factory.create :usuario
    residencia2 = Factory.create :residencia, :usuario_id => usuario2.id

    sign_in usuario1
    get :index, :id => residencia2.id
    assigns(:residencia).should_not == residencia2
    assigns(:residencia).should == residencia1
    flash[:error].should_not be_nil
  end

  it 'um usuário não pode alterar um periferico que não é seu' do
    usuario1 = Factory.create :usuario
    residencia1 = Factory.create :residencia, :usuario_id => usuario1.id
    comodo1 = Factory.create :comodo, :residencia_id => residencia1.id
    periferico1 = Factory.create :periferico, :comodo_id => comodo1.id

    usuario2 = Factory.create :usuario
    residencia2 = Factory.create :residencia, :usuario_id => usuario2.id
    comodo2 = Factory.create :comodo, :residencia_id => residencia2.id
    periferico2 = Factory.create :periferico, :comodo_id => comodo2.id

    sign_in usuario1
    xhr :post, :alterar_estado, {:id => periferico2.id.to_s}
    assigns(:periferico).estado.should_not be
    flash[:error].should_not be_nil
  end

end

