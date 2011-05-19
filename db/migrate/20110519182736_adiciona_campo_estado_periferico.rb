class AdicionaCampoEstadoPeriferico < ActiveRecord::Migration
  def self.up
    add_column Periferico.table_name, :estado, :boolean
  end

  def self.down
    remove_column Periferico.table_name, :estado
  end
end

