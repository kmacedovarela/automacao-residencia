class Preset < ActiveRecord::Base

  belongs_to :residencia
  serialize :estado_perifericos

  validates :nome, :presence => true
  validates_uniqueness_of :nome

end

