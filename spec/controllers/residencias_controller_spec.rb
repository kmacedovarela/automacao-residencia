require 'spec_helper'
include Devise::TestHelpers

describe ResidenciasController do

  before do
    @residencia = Factory.create :residencia

    sign_in @residencia.usuario
  end

  describe "GET show" do

    before do
      Factory.create :comodo, :residencia => @residencia
      Factory.create :comodo, :residencia => @residencia
    end

    it "deveria detalhar a residencia listando seus comodos" do
      get :show, :id => @residencia.id, :usuario_id => @residencia.usuario.id

      assigns(:residencia).usuario.should_not be_nil
      assigns(:residencia).id.should == @residencia.id
      assigns(:residencia).comodos.size.should == 2

      assigns(:comodo).should_not be_nil
      assigns(:comodo).residencia.should == @residencia
    end
  end

  describe "GET new" do
    it "deveria carregar o new" do
      xhr :get, :new, :usuario_id => @residencia.usuario.id
      assigns(:residencia).should be_new_record
    end
  end
  describe "GET edit" do
    it "deveria preparar a residecia para edicao" do
      xhr :get, :edit, :id => @residencia.id, :usuario_id => @residencia.usuario.id
      assigns(:residencia).should_not be_nil
      assigns(:residencia).should == @residencia
    end
  end

  describe "POST create" do
    before do
      @valid_params = {
                        :usuario_id => @residencia.usuario.id,
                        :residencia => {
                          :cidade => "Brasília",
                          :uf => "DF",
                          :endereco => "QND 1 CASA 01",
                          :cep => '72120-600'
                        }
                      }

      @invalid_params = {
                    :usuario_id => @residencia.usuario.id,
                    :residencia => {
                      :cidade => "Brasília",
                      :uf => "DF",
                      :endereco => nil, #INVALID!
                      :cep => '72120-600'
                    }
                  }
    end

    describe "with valid params" do
      it "deveria criar uma nova residencia" do
        xhr :post, :create, @valid_params
        assigns(:residencia).errors.should be_empty
        assigns(:residencia).new_record?.should be_false
        assigns(:residencias).should_not be_nil

        flash[:notice].should_not be_nil
      end
    end

    describe "with invalid params" do
      it "nao deveria criar uma residencia e deveria atribuir os erros a @residencia" do
        xhr :post, :create, @invalid_params

        assigns(:residencia).errors.should_not be_empty
        assigns(:residencia).new_record?.should be_true
        assigns(:residencias).should be_nil

        flash[:notice].should be_nil
      end
    end
  end

  describe "PUT update" do

    before do
      @valid_params = {
                        :id => @residencia.id,
                        :usuario_id => @residencia.usuario.id,
                        :residencia => {
                          :cidade => "Chaparral",
                          :uf => "DF",
                          :endereco => "QNL 1 CASA 01",
                          :cep => '72120-600'
                        }
                      }

      @invalid_params = {
                    :id => @residencia.id,
                    :usuario_id => @residencia.usuario.id,
                    :residencia => {
                      :cidade => "Brasília",
                      :uf => "DF",
                      :endereco => nil, #INVALID!
                      :cep => '72120-600'
                    }
                  }
    end

    describe "with valid params" do
      it "deveria atualizar a residencia" do
        xhr :put, :update, @valid_params

        assigns(:residencia).errors.should be_empty
        assigns(:residencia).endereco.should == @valid_params[:residencia][:endereco]
        assigns(:residencias).should_not be_nil

        flash[:notice].should_not be_nil
      end
    end

    describe "with invalid params" do
      it "nao deveria atualizar a residencia e deveria atribuir os erros a @residencia" do
        xhr :put, :update, @invalid_params

        assigns(:residencia).errors.should_not be_empty
        assigns(:residencias).should be_nil

        flash[:notice].should be_nil
      end
    end
  end

  describe "DELETE destroy" do
    it 'deveria deletar a residencia ' do
      xhr :delete, :destroy, :id => @residencia.id, :usuario_id => @residencia.usuario.id
      flash[:notice].should_not be_nil
      assigns(:residencias).should_not be_nil

      lambda{Residencia.find @residencia.id}.should raise_error
    end
  end
end

