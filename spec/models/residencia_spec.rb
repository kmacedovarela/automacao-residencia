require 'spec_helper'

describe Residencia do
  before (:each) do
    usuario = Factory.create :usuario
    @residencia = Residencia.create(
                    :cidade => 'Brasilia',
                    :uf => 'DF',
                    :endereco => 'Qns 21 Cs 13',
                    :cep => '72121-300',
                    :usuario => usuario
                  )
  end

  context 'quando referente a validação dos campos' do

    it {should validate_presence_of :cidade}
    it {should validate_presence_of :uf}
    it {should validate_presence_of :endereco}
    it {should validate_presence_of :cep}
    it {should validate_presence_of :usuario}

    it {should validate_uniqueness_of :endereco}

    context 'formato do cep' do
      it { should allow_value("72120-600").for(:cep) }

      it { should_not allow_value("72120").for(:cep) }
      it { should_not allow_value("72120600").for(:cep) }
      it { should_not allow_value("72120-6000").for(:cep) }
    end

    context 'formato do uf' do
      it { should allow_value("DF").for(:uf) }

      it { should_not allow_value("df").for(:uf) }
      it { should_not allow_value("DFA").for(:uf) }
      it { should_not allow_value("D").for(:uf) }
    end
  end

  context 'quando referente as associacoes' do
    it { should belong_to(:usuario) }
    it { should have_many(:comodos) }
    it { should have_many(:presets) }

    it 'deveria possuir tomadas'

    it 'deveria deletar as tomadas associadas quando for deletada'

  end

  it 'deveria pesquisa por parte do nome' do
    Residencia.com_endereco_semelhante_a('Q').should_not be_blank
  end
 
  it 'deveria pesquisar por parte do nome com ignorecase ' do
    Residencia.com_endereco_semelhante_a('q').should_not be_blank
  end

end

