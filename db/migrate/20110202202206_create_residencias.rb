class CreateResidencias < ActiveRecord::Migration
  def self.up
    create_table :residencias do |t|
      t.string :cidade
      t.string :uf
      t.string :endereco
      t.string :cep
      t.integer :usuario_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :residencias
  end
end
