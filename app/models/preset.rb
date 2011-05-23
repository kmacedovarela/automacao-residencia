class Preset < ActiveRecord::Base

  serialize :estado_perifericos

  validates :nome, :presence => true

end

