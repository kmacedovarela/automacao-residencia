class CreateComodos < ActiveRecord::Migration
  def self.up
    create_table :comodos do |t|
      t.string :nome
      t.integer :residencia_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comodos
  end
  
end
