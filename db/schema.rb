# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110614153622) do

  create_table "comodos", :force => true do |t|
    t.string   "nome"
    t.integer  "residencia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comodos", ["residencia_id"], :name => "comodos_residencia_id_fk"

  create_table "perifericos", :force => true do |t|
    t.string   "nome"
    t.integer  "pino"
    t.integer  "comodo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "estado"
  end

  add_index "perifericos", ["comodo_id"], :name => "perifericos_comodo_id_fk"

  create_table "presets", :force => true do |t|
    t.string   "nome"
    t.string   "estado_perifericos"
    t.integer  "residencia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presets", ["residencia_id"], :name => "presets_residencia_id_fk"

  create_table "residencias", :force => true do |t|
    t.string   "cidade"
    t.string   "uf"
    t.string   "endereco"
    t.string   "cep"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "residencias", ["usuario_id"], :name => "residencias_usuario_id_fk"

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "cpf"
    t.string   "telefone"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt"
    t.string   "reset_password_token"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_foreign_key "comodos", "residencias", :name => "comodos_residencia_id_fk", :dependent => :delete

  add_foreign_key "perifericos", "comodos", :name => "perifericos_comodo_id_fk", :dependent => :delete

  add_foreign_key "presets", "residencias", :name => "presets_residencia_id_fk"

  add_foreign_key "residencias", "usuarios", :name => "residencias_usuario_id_fk", :dependent => :delete

end
