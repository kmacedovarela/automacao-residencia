class Comodo < ActiveRecord::Base
  
  belongs_to :residencia
  has_many :perifericos

end
