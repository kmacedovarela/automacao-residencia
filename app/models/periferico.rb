class Periferico < ActiveRecord::Base

  belongs_to :comodo

  validates :pino, :numericality => true
  validates :nome, :pino, :presence => true

  def estado_ligado
  	(pino.to_s + "9").to_i
  end

  def estado_desligado
    pino
  end

end

