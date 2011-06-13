require 'spec_helper'

describe Usuario do

  before do
   @usuario = Usuario.create(
     :nome => 'ReK',
     :password => '123',
     :email => 'hodrigothicatha@gmail.com',
     :cpf => '036.054.041-46',
     :tipo => Usuario::ROLE[:administrador],
     :telefone => '(61) 8434-0652'
    )  
  end

  context 'quando referente as permissoes' do
    
    it 'deveria acessar os dados apenas da sua residencia'
    
  end
  
  context 'quando referente a validação dos campos' do
    it {should validate_presence_of :nome}
    it {should validate_presence_of :email}
    it {should validate_presence_of :cpf}
    it {should validate_presence_of :tipo}
    it {should validate_presence_of :telefone}

    # Unique
    context 'unicidade dos campos' do
      it {should validate_uniqueness_of :cpf}
      it {should validate_uniqueness_of :email}
    end
    
    context 'formato do email' do
      it { should allow_value("teste@gmail.com").for(:email) }
      it { should allow_value("teste@yahoo.com.br").for(:email) }
      
      it { should_not allow_value("teste.com.br").for(:email) }
      it { should_not allow_value("teste@g").for(:email) }
    end
   
    context 'formato do cpf' do
      it { should allow_value("111.111.111-44").for(:cpf) }
      
      it { should_not allow_value("123.123.123.12").for(:cpf) }
      it { should_not allow_value("061.111.222-1").for(:cpf) }
      it { should_not allow_value("11111111124").for(:cpf) }
    end
    
    context 'formato do telefone' do
      it { should_not allow_value("123").for(:telefone) }
      it { should_not allow_value("(61) 843406").for(:telefone) }
      it { should_not allow_value("61 84340656").for(:telefone) }
      it { should allow_value("(61) 8434-0656").for(:telefone) }
    end
  end  
  
  context 'quando referente as associacoes' do
  
    it { should have_many(:residencias) }
    
    it 'deveria deletar as residencias quando usuario for deletado?'
    
  end
  
  it 'deveria pesquisa por parte do nome' do
    Usuario.com_nome_semelhante_a('R').should_not be_blank
  end
 
  it 'deveria pesquisar por parte do nome com ignorecase ' do
    Usuario.com_nome_semelhante_a('R').should_not be_blank
  end
 
 describe 'tipo' do

   it 'deveria verificar se é um administrador' do
     @usuario.role_administrador?.should be_true
     @usuario.role_proprietario?.should be_false
   end

   it 'deveria verificar se é um proprietario' do
     @usuario.tipo = Usuario::ROLE[:proprietario]
     @usuario.save.should be_true
     
     @usuario.role_administrador?.should be_false
     @usuario.role_proprietario?.should be_true
   end
   
 end
end
