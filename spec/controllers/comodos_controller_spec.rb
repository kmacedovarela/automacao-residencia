require 'spec_helper'
include Devise::TestHelpers

describe ComodosController do

  before do
    @comodo = Factory.create :comodo
    @residencia = @comodo.residencia
    @usuario = @comodo.residencia.usuario

    sign_in @usuario
  end

  describe "GET show" do

    before do
      Factory.create :periferico, :comodo => @comodo
      Factory.create :periferico, :comodo => @comodo
    end

    it "deveria detalhar o comodo e carregar a lista de perifericos" do
      get :show, :id => @comodo.id, :residencia_id => @residencia.id, :usuario_id => @usuario.id

      assigns(:comodo).residencia.should_not be_nil
      assigns(:comodo).id.should == @comodo.id
      assigns(:comodo).perifericos.size.should == 2

      assigns(:periferico).should_not be_nil
      assigns(:periferico).comodo.should == @comodo
    end
  end

  describe "GET edit" do
    it "deveria preparar o comodo para edicao" do
      xhr :get, :edit, :id => @comodo.id, :residencia_id => @residencia.id, :usuario_id => @usuario.id
      assigns(:comodo).should_not be_nil
      assigns(:comodo).should == @comodo
    end
  end

  describe "GET new" do
    it "deveria carregar o new" do
      xhr :get, :new, :residencia_id => @residencia.id, :usuario_id => @usuario.id
      assigns(:comodo).should be_new_record
    end
  end


  describe "POST create" do
    before do
      @valid_params = {
                        :usuario_id => @usuario.id,
                        :residencia_id =>@residencia.id,
                        :comodo => {
                          :nome => "Sala"
                        }
                      }

      @invalid_params = {
                    :usuario_id => @usuario.id,
                    :residencia_id =>@residencia.id,
                    :comodo => {
                      :nome => nil #INVALID
                    }
                  }
    end

    describe "with valid params" do
      it "deveria criar um novo comodo" do
        xhr :post, :create, @valid_params
        assigns(:comodo).errors.should be_empty
        assigns(:comodo).new_record?.should be_false
        assigns(:comodo).should_not be_nil

        flash[:notice].should_not be_nil
      end
    end

    describe "with invalid params" do
      it "nao deveria criar um novo comodo e deveria atribuir os erros a @comodo" do
        xhr :post, :create, @invalid_params

        assigns(:comodo).errors.should_not be_empty
        assigns(:comodo).new_record?.should be_true
        assigns(:comodos).should be_nil

        flash[:notice].should be_nil
      end
    end
  end

  describe "PUT update" do
    before do
      @valid_params = {
                        :id => @comodo.id,
                        :usuario_id => @usuario.id,
                        :residencia_id =>@residencia.id,
                        :comodo => {
                          :nome => "Sala"
                        }
                      }

      @invalid_params = {
                    :id => @comodo.id,
                    :usuario_id => @usuario.id,
                    :residencia_id =>@residencia.id,
                    :comodo => {
                      :nome => nil #INVALID
                    }
                  }
    end

    describe "with valid params" do
      it "deveria atualizar o comodo" do
        xhr :put, :update, @valid_params

        assigns(:comodo).errors.should be_empty
        assigns(:comodo).nome.should == @valid_params[:comodo][:nome]
        assigns(:comodo).residencia.should_not be_nil
        assigns(:comodos).should_not be_nil

        flash[:notice].should_not be_nil
      end
    end

    describe "with invalid params" do
      it "nao deveria atualizar o comodo e deveria atribuir os erros a @comodo" do
        xhr :put, :update, @invalid_params

        assigns(:comodo).errors.should_not be_empty
        assigns(:comodos).should be_nil

        flash[:notice].should be_nil
      end
    end
  end

  describe "DELETE destroy" do
    it 'deveria deletar o comodo ' do
      xhr :delete, :destroy, :id => @comodo.id, :residencia_id => @residencia.id, :usuario_id => @usuario.id
      flash[:notice].should_not be_nil
      assigns(:comodos).should_not be_nil

      lambda{Comodo.find @comodo.id}.should raise_error
    end
  end

end

