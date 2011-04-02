class Comodo < ActiveRecord::Base
  
  belongs_to :residencia
  has_many :perifericos
  
  validates_presence_of :nome
end
