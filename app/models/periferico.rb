class Periferico < ActiveRecord::Base

  belongs_to :comodo

  validates :pino, :numericality => true
  validates :nome, :pino, :presence => true

  def estado_ligado
    pino
  end

  def estado_desligado
    (pino.to_s + "9").to_i
  end

end

