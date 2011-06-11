require 'spec_helper'

describe Preset do

  before do
  	@periferico1 = Factory.create :periferico
  	@periferico2 = Factory.create :periferico

    @preset = Factory.create :preset, 
    						 :estado_perifericos => {
	    						 @periferico1.id.to_s => "desligado", 
	    						 @periferico2.id.to_s => "ligado"
	    						}
  end

  context 'quando referente a validação dos campos' do
    it { should validate_presence_of :nome }
    it { should belong_to :residencia }

    it { should validate_uniqueness_of :nome }
  end

  it 'deveria recuperar os perifericos' do
  	perifericos = Periferico.find( @preset.estado_perifericos.keys )
  	@preset.perifericos.should eql(perifericos)
  end

  context 'quando referente a integracao com arduino' do


	it 'deveria ativar os perifericos' do
		@preset.perifericos.each { |periferico| periferico.update_attribute(:estado, false) }
		puts " aaaaa"
		p @preset.estado_perifericos
		puts " aaaaa"
		@preset.ativar!
		@periferico1.estado.should be_false
		@periferico2.estado.should be_true
	end
  end
end

