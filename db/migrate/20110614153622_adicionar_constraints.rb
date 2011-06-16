class AdicionarConstraints < ActiveRecord::Migration
  def self.up
    add_foreign_key(:residencias, :usuarios, :dependent => :delete) 
    add_foreign_key(:comodos, :residencias, :dependent => :delete)
    add_foreign_key(:perifericos, :comodos, :dependent => :delete)    
    add_foreign_key(:presets, :residencias)    
  end

  def self.down
  end
end
