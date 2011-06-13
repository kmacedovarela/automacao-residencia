require 'spec_helper'
include Devise::TestHelpers

describe HomeController do

	
  before do
    @usuario = Factory.create :usuario

    sign_in @usuario
  end

  describe "quando referente a busca" do
    it 'deveria buscar os usuarios que possuem a parte do nome informada' do
      Factory.create :usuario, :nome => 'teste'
      Factory.create :usuario, :nome => 'ateste'
      Factory.create :usuario, :nome => 'test'

      get :buscar, :campo => 'test', :tipo => 'usuario'

      assigns(:usuarios).size.should == 3
      assigns(:usuario).should_not be_nil
   end

   it 'deveria buscar as residencias que possuem a parte do nome informada' do
      Factory.create :residencia, :endereco => 'teste'
      Factory.create :residencia, :endereco => 'ateste'
      Factory.create :residencia, :endereco => 'test'

      get :buscar, :campo => 'test', :tipo => 'residencia'

      assigns(:residencias).size.should == 3
      assigns(:residencia).should_not be_nil
   end
  end

end