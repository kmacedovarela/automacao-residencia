class AddDevise < ActiveRecord::Migration
  def self.up
    null    = false
    default = ""

    add_column :usuarios, :encrypted_password, :string, :null => null, :default => default, :limit => 128
    add_column :usuarios, :password_salt, :string
    add_column :usuarios, :reset_password_token, :string
    add_column :usuarios, :sign_in_count,      :integer, :default => 0
    add_column :usuarios, :current_sign_in_at, :datetime
    add_column :usuarios, :last_sign_in_at,    :datetime
    add_column :usuarios, :current_sign_in_ip, :string
    add_column :usuarios, :last_sign_in_ip,    :string
  end

  def self.down
    remove_column :usuarios, :encrypted_password
    remove_column :usuarios, :password_salt
    remove_column :usuarios, :reset_password_token
    remove_column :usuarios, :sign_in_count
    remove_column :usuarios, :current_sign_in_at
    remove_column :usuarios, :last_sign_in_at
    remove_column :usuarios, :current_sign_in_ip
    remove_column :usuarios, :last_sign_in_ip
  end
end

