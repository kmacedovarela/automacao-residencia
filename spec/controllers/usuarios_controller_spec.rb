require 'spec_helper'
include Devise::TestHelpers

describe UsuariosController do

  valid_params = {
    :usuario => {
      :nome => 'Coracao',
      :email => 'garutobisensei@gmail.com',
      :password => '123',
      :cpf => '732.123.321-43',
      :telefone => '(61) 3035-2312',
      :tipo => Usuario::ROLE[:administrador]
    }
  }

  invalid_params = {
    :usuario => {
      :nome => 'Coracao',
      :password => '123',
      :telefone => '(61) 3035-2312',
      :tipo => Usuario::ROLE[:administrador]
    }
  }

  before do
    @usuario = Factory :usuario, :nome => 'Rodrigo e Karina'
    Factory :usuario, :nome => 'karina e rodrigo'

    sign_in @usuario
  end

  describe "GET index" do

    it "assigns all usuarios as @usuarios order by nome" do
      get :index
      assigns(:usuarios).should_not be_nil
      assigns(:usuarios).first.nome == 'karina e rodrigo'
      assigns(:usuario).should_not be_nil
    end

  end

  describe "GET show" do
    context 'quando possuir varias residencias' do

      it "deveria redirecionar para o show de usuario carregando residencia" do
        usuario = Factory.create :usuario
        residencia = Factory.create :residencia, :usuario => usuario
        Factory.create :residencia, :usuario => usuario

        residencia.usuario.residencias.size.should > 1
        xhr :get, :show, :id => residencia.usuario.id
        assigns(:residencia).should_not be_nil
        assigns(:residencia).usuario.should == residencia.usuario
        response.should render_template :show
      end

    end

#    context 'quando possuir apenas uma residencia' do
#      it 'deveria redirecionar para o show de residencia' do
#        residencia = Factory.create :residencia

#        residencia.usuario.residencias.size.should == 1
#        xhr :get, :show, :id => residencia.usuario.id
#        response.should redirect_to(usuario_residencia_path(residencia.usuario, residencia))
#      end
#    end
  end

  describe "GET edit" do
    it "deve atribuir o usuario a @usuario" do
      xhr :get, :edit, :id => @usuario.id
      assigns(:usuario).should == @usuario
    end
  end

  describe "GET new" do
    it "deve atribuir criar um novo usuário" do
      xhr :get, :new
      assigns(:usuario).should be_new_record
    end
  end

  describe "POST create" do

    context "com parametros validos" do

      it "deveria criar usuario e atribuir o novo usuario a @usuario" do
        xhr :post, :create, valid_params

        assigns(:usuario).errors.should be_empty
        assigns(:usuario).new_record?.should be_false
        assigns(:usuarios).should_not be_nil

        flash[:notice].should_not be_nil
      end

    end

    context "com parametros invalidos" do

      it "nao deveria criar o usuario e atribuir usuario a @usuario" do
        xhr :post, :create, invalid_params

        assigns(:usuario).errors.should_not be_empty
        assigns(:usuario).new_record?.should be_true
        assigns(:usuarios).should be_nil

        flash[:notice].should be_nil
      end

    end
  end

  describe "PUT update" do

    describe "com parametros validos" do
      it "atualizado o usuario requerido" do
        @usuario.nome = 'Rodrigatao :D'
        xhr :put, :update, :id => @usuario.id, :usuario => {:nome => @usuario.nome}

        assigns(:usuario).errors.should be_empty
        assigns(:usuario).nome.should == @usuario.nome
        assigns(:usuarios).should_not be_nil

        flash[:notice].should_not be_nil
      end

    end

    describe "com parametros invalidos" do
      it "atribui o usuario a @usuario" do
        @usuario.nome = nil
        xhr :put, :update, :id => @usuario.id, :usuario => {:nome => @usuario.nome}

        assigns(:usuario).errors.should_not be_empty
        assigns(:usuario).nome.should == @usuario.nome
        assigns(:usuarios).should be_nil

        flash[:notice].should be_nil
      end
    end
  end

  describe "DELETE destroy" do
    it "exclui o usuario requerido" do
      xhr :delete, :destroy, :id => @usuario.id
      flash[:notice].should_not be_nil
      assigns(:usuarios).should_not be_nil

      lambda{Usuario.find usuario.id}.should raise_error
    end
  end

end

