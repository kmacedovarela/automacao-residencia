require 'spec_helper'
include Devise::TestHelpers

describe PerifericosController do

  before do
    @periferico = Factory.create :periferico
    @comodo = @periferico.comodo
    @residencia = @periferico.comodo.residencia
    @usuario = @periferico.comodo.residencia.usuario

    sign_in @usuario
  end

  describe "GET edit" do
    it "deveria preparar o periferico para edicao" do
      xhr :get, :edit,  :id => @periferico.id,
                        :comodo_id => @comodo.id,
                        :residencia_id => @residencia.id,
                        :usuario_id => @usuario.id

      assigns(:periferico).should_not be_nil
      assigns(:periferico).should == @periferico
    end
  end

  describe "POST create" do
    before do
      @valid_params = {
                        :usuario_id => @usuario.id,
                        :residencia_id =>@residencia.id,
                        :comodo_id => @comodo.id,
                        :periferico => {
                          :nome => "Lampada",
                          :pino => "1"
                        }
                      }

      @invalid_params = {
                    :usuario_id => @usuario.id,
                    :residencia_id =>@residencia.id,
                    :comodo_id => @comodo.id,
                    :periferico => {
                      :nome => nil, #INVALID
                      :pino => "1"
                    }
                  }
    end

    describe "with valid params" do
      it "deveria criar um novo periferico" do
        xhr :post, :create, @valid_params
        assigns(:periferico).errors.should be_empty
        assigns(:periferico).new_record?.should be_false
        assigns(:perifericos).should_not be_nil

        flash[:notice].should_not be_nil
      end
    end

    describe "with invalid params" do
      it "nao deveria criar um novo periferico e deveria atribuir os erros a @periferico" do
        xhr :post, :create, @invalid_params

        assigns(:periferico).errors.should_not be_empty
        assigns(:periferico).new_record?.should be_true
        assigns(:perifericos).should be_nil

        flash[:notice].should be_nil
      end
    end
  end

  describe "PUT update" do
    before do
      @valid_params = {
                        :id => @periferico.id,
                        :usuario_id => @usuario.id,
                        :residencia_id =>@residencia.id,
                        :comodo_id => @comodo.id,
                        :periferico => {
                          :nome => "Lampada",
                          :pino => "1"
                        }
                      }

      @invalid_params = {
                    :id => @periferico.id,
                    :usuario_id => @usuario.id,
                    :residencia_id =>@residencia.id,
                    :comodo_id => @comodo.id,
                    :periferico => {
                      :nome => nil, #INVALIDO
                      :pino => nil #INVALIDO
                    }
                  }
    end

    describe "with valid params" do
      it "deveria atualizar o comodo" do
        xhr :put, :update, @valid_params

        assigns(:periferico).errors.should be_empty
        assigns(:periferico).nome.should == @valid_params[:periferico][:nome]
        assigns(:periferico).comodo.should_not be_nil
        assigns(:perifericos).should_not be_nil

        flash[:notice].should_not be_nil
      end
    end

    describe "with invalid params" do
      it "nao deveria atualizar o periferico e deveria atribuir os erros a @periferico" do
        xhr :put, :update, @invalid_params

        assigns(:periferico).errors.should_not be_empty
        assigns(:perifericos).should be_nil

        flash[:notice].should be_nil
      end
    end
  end

  describe "DELETE destroy" do
    it 'deveria deletar o comodo ' do
      xhr :delete, :destroy, :id => @periferico.id,
                             :comodo_id => @comodo.id,
                             :residencia_id => @residencia.id,
                             :usuario_id => @usuario.id

      flash[:notice].should_not be_nil
      assigns(:perifericos).should_not be_nil

      lambda{Periferico.find @periferico.id}.should raise_error
    end
  end
end

