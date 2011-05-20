class Preset < ActiveRecord::Base

  has_many :periferico

  validates :nome, :presence => true

end

