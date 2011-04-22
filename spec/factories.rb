FactoryGirl.define do

  factory :usuario do
    sequence(:nome) { |n| "Usuario #{n}" }
    password "123"
    sequence(:cpf) { |n| ("123.123.123-#{n*333}")[0..15] }
    sequence(:email) { |n| "usuario#{n}@gmail.com" }
    telefone '(61) 3038-2482'
    tipo 'Administrador'
  end

  factory :residencia do
    cidade "Brasília"
    uf "DF"
    sequence(:endereco) { |n| "QND #{n} CASA #{n}" }
    sequence(:cep) { |n| ("123456-#{n*333}")[0..9] }
    association :usuario, :factory => :usuario
  end

  factory :comodo do
    sequence(:nome) { |n| "Comodo #{n}" }
    association :residencia, :factory => :residencia
  end

  factory :periferico do
    sequence(:nome) { |n| "Periferico #{n}" }
    pino "1"
    association :comodo, :factory => :comodo
  end

end

