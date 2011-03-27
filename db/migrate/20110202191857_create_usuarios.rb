class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :cpf
      t.string :telefone
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
