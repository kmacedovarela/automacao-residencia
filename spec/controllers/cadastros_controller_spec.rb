require 'spec_helper'

describe CadastrosController do
  it 'deveria carregar o index' do
    get :index
    response.should render_template :index
    
    assigns(:usuario).should_not be_nil
  end
  
  it 'deveria criar um usuario' do
    hash = {
      :usuario => {
        :nome => 'ReK',
        :password => '123',
        :email => 'hodrigothicatha@gmail.com',
        :cpf => '036.054.041-46',
        :tipo => Usuario::ROLE[:administrador],
        :telefone => '(61) 8434-0652'
      }
    }
    
    xhr :post, :create_usuario, hash
  
    response.should be_success
    usuario = assigns(:usuario)
    usuario.should_not be_nil
    usuario.new_record?.should be_false
    
    assigns(:residencia).should_not be_nil
    assigns(:residencia).usuario.id.should eql usuario.id 
  end
  
  it 'deveria cadastrar uma residencia' do
    usuario = Factory.create :usuario
    
    hash = {
      :residencia => {
        :cidade => 'Brasilia',
        :uf => 'DF',
        :endereco => 'Qns 21 Cs 13',
        :cep => '72121-300',
        :usuario_id => usuario.id
      }
    }
    
    xhr :post, :create_residencia, hash
    
    res = assigns(:residencia)
    res.should_not be_nil
    res.should_not be_new_record
    
    assigns(:comodo).should_not be_nil
  end
  
  it 'deveria cadastrar um comodo' do
    residencia = Factory.create :residencia
    
    hash = {
      :comodo => {
        :nome => 'Sala',
        :residencia_id => residencia.id
      }
    }
    
    xhr :post, :create_comodo, hash
    
    comodo = assigns(:comodo)
    comodo.should_not be_nil
    comodo.should_not be_new_record
    
    assigns(:periferico).should_not be_nil
  end
  
  it 'deveria cadastrar um periferico' do
    comodo = Factory.create :comodo
    
    hash = {
      :periferico => {
        :nome => 'Lampada',
        :pino => 1,
        :comodo_id => comodo.id
      }
    }
    
    xhr :post, :create_periferico, hash
    
    periferico = assigns(:periferico)
    periferico.should_not be_nil
    periferico.should_not be_new_record
    
    assigns(:periferico).should_not be_nil
  end
end