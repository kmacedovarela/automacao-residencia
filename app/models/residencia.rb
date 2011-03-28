class Residencia < ActiveRecord::Base
  
  belongs_to :usuario
  has_many :comodos
  
  validates :cidade, :usuario, :presence => true
  validates :cep, :presence => true, :format => {:with => /\d{5}-\d{3}$/}
  validates :uf, :presence => true, :format => {:with => /[A-Z]/}, :length => { :minimum => 2, :maximum => 2 }
  validates :endereco, :presence => true, :uniqueness => true

  def self.todas_por_usuario usuario_id
    Residencia.all(:conditions => { :usuario_id => usuario_id })
  end
    
end
