class CreatePerifericos < ActiveRecord::Migration
  def self.up
    create_table :perifericos do |t|
      t.string :nome
      t.integer :pino       #referente ao pino que sera ligado a arduino
      t.integer :comodo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :perifericos
  end
end
