class CreatePresets < ActiveRecord::Migration
  def self.up
    create_table :presets do |t|
      t.string :nome
      t.string :estado_perifericos
      t.integer :residencia_id

      t.timestamps
    end
  end

  def self.down
    drop_table :presets
  end
end

