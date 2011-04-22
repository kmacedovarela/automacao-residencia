require 'spec_helper'

describe Periferico do

  context 'quando referente as associacoes' do
    it { should belong_to(:comodo) }
  end

  context 'quando referente a validação dos campos' do
    it { should validate_presence_of :nome }
    it { should validate_presence_of :pino }
    it { should validate_numericality_of(:pino) }
  end

end

