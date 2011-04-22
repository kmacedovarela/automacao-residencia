class Periferico < ActiveRecord::Base

  belongs_to :comodo

  validates :pino, :numericality => true
  validates :nome, :pino, :presence => true
end

