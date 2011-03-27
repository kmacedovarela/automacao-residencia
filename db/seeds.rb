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