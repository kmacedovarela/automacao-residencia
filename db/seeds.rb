# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
 
Usuario.create! :nome => 'Rodrigo Ramalho', 
                :email => 'hodrigohamalho@gmail.com',
                :password => '123',
                :cpf => '732.123.123-32',
                :telefone => '(61) 8173-2341',
                :tipo => Usuario::ROLE[:administrador]                

Usuario.create! :nome => 'Karina Macedo', 
                :email => 'kmacedovarela@gmail.com',
                :password => '123',
                :cpf => '732.123.123-33',
                :telefone => '(61) 8173-2342',
                :tipo => Usuario::ROLE[:administrador]                
                
Usuario.create! :nome => 'Usuario de Teste', 
                :email => 'teste@gmail.com',
                :password => '123',
                :cpf => '732.123.123-34',
                :telefone => '(61) 8173-2342',
                :tipo => Usuario::ROLE[:administrador]                
                
Usuario.create! :nome => 'Usuario Proprietario', 
                :email => 'dono1@gmail.com',
                :password => '123',
                :cpf => '732.922.123-34',
                :telefone => '(61) 8173-2342',
                :tipo => Usuario::ROLE[:proprietario]       
                
                
Residencia.create! :cidade => 'Taguatinga',
                   :uf => "DF",  
                   :endereco => "QSD 12 casa 12",
                   :cep => "72000-100",
                   :usuario => Usuario.last

Comodo.create! :nome => "sala",
               :residencia => Residencia.first
               
Comodo.create! :nome => "quarto",
               :residencia => Residencia.first
                                             
Periferico.create! :nome => "lampada 1",
                   :pino => 1,
                   :comodo => Comodo.first

Periferico.create! :nome => "lampada 2",
                  :pino => 2,
                  :comodo => Comodo.first                   

Periferico.create! :nome => "lampada 3",
                  :pino => 3,
                  :comodo => Comodo.first                  

Periferico.create! :nome => "lampada 4",
                   :pino => 1,
                   :comodo => Comodo.last

Periferico.create! :nome => "lampada 5",
                  :pino => 2,
                  :comodo => Comodo.last

Periferico.create! :nome => "lampada 6",
                  :pino => 3,
                  :comodo => Comodo.last
                  