# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_09_021916) do
  create_table "admins", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.date "data_nascimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "agendamentos", force: :cascade do |t|
    t.datetime "inicioAtendimento"
    t.datetime "fimAtendimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_id", null: false
    t.integer "barbeiro_id", null: false
    t.integer "service_id", null: false
    t.index ["barbeiro_id"], name: "index_agendamentos_on_barbeiro_id"
    t.index ["cliente_id"], name: "index_agendamentos_on_cliente_id"
    t.index ["service_id"], name: "index_agendamentos_on_service_id"
  end

  create_table "barbeiros", force: :cascade do |t|
    t.string "nome"
    t.date "data_nascimento"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_barbeiros_on_email", unique: true
    t.index ["reset_password_token"], name: "index_barbeiros_on_reset_password_token", unique: true
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.date "data_nascimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_clientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
  end

  create_table "services", force: :cascade do |t|
    t.string "nome"
    t.string "valor"
    t.string "tempo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agendamentos", "barbeiros"
  add_foreign_key "agendamentos", "clientes"
  add_foreign_key "agendamentos", "services"
end
