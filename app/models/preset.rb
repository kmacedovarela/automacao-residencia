require 'arduino'

class Preset < ActiveRecord::Base

  include Arduino

  belongs_to :residencia
  serialize :estado_perifericos

  validates :nome, :presence => true
  validates_uniqueness_of :nome

  def perifericos
  	Periferico.find self.estado_perifericos.keys
  end

  def ativar!
  	self.perifericos.each do |periferico|
  		alterar_estado_periferico periferico, self.estado_perifericos[periferico.id.to_s]
  	end
  end
end

