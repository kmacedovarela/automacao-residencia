class Usuario < ActiveRecord::Base

  ROLE = {
    :proprietario => 'Proprietário',
    :administrador => 'Administrador'    
  }

  has_many :residencias

  validates :nome, :email, :telefone, :cpf, :tipo, :presence => true
  validates :email, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :telefone, :presence => true,  :format => { :with => /\(\d{2}\) \d{4}-\d{4}/ }
  validates :cpf, :presence => true, :uniqueness => true, :format => {:with => /\d{3}.\d{3}.\d{3}-\d{2}/}

  devise :database_authenticatable, :recoverable, :trackable, :timeoutable,
         :timeout_in => 20.minutes

  ################### Metodos de Classe ####################

  def self.com_nome_semelhante_a nome = ''
    Usuario.where('nome like ?', "%#{nome}%")
  end

  def method_missing(method, *args, &block)
    # Verifica se o método informado obedece ao padrão 'role_', caso sim pega o restante do
    # nome do método e verifica o tipo do usuario.
    # Ex de uso: Usuario.role_admistrador? => true
    #
    if method.to_s =~ /^role_(\w*)?/
      return self.tipo == Usuario::ROLE[$1.intern]
    end

    super(method, *args, &block)
  end

end
