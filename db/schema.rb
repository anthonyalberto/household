# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121021125250) do

  create_table "balance_utilisateurs", :force => true do |t|
    t.integer  "utilisateur_id", :null => false
    t.integer  "montant_cents",  :null => false
    t.integer  "mois",           :null => false
    t.integer  "annee",          :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "balance_utilisateurs", ["utilisateur_id"], :name => "index_balance_utilisateurs_on_utilisateur_id"

  create_table "balances", :force => true do |t|
    t.string   "nom",                              :null => false
    t.integer  "montant_cents",                    :null => false
    t.boolean  "fini",          :default => false, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "balances", ["fini"], :name => "index_balances_on_fini"

  create_table "chats", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "monnaies", :force => true do |t|
    t.string   "iso",                                  :null => false
    t.float    "pourcent_vers_cad", :default => 100.0, :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "monnaies", ["iso"], :name => "index_monnaies_on_iso"

  create_table "mouvement_recurrents", :force => true do |t|
    t.integer  "payeur_id",                                      :null => false
    t.integer  "montant_cents",                                  :null => false
    t.integer  "type_de_mouvement_id",                           :null => false
    t.float    "pourcent_a_facturer_a_lautre", :default => 50.0, :null => false
    t.string   "frequence_manuelle"
    t.string   "frequence_automatique"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "mouvement_recurrents", ["payeur_id", "type_de_mouvement_id"], :name => "index_mouvement_recurrents_on_payeur_id_and_type_de_mouvement_id"
  add_index "mouvement_recurrents", ["payeur_id"], :name => "index_mouvement_recurrents_on_payeur_id"
  add_index "mouvement_recurrents", ["type_de_mouvement_id"], :name => "index_mouvement_recurrents_on_type_de_mouvement_id"

  create_table "mouvements", :force => true do |t|
    t.integer  "payeur_id",                                       :null => false
    t.string   "texte"
    t.integer  "montant_cents",                                   :null => false
    t.integer  "type_de_mouvement_id"
    t.integer  "balance_id"
    t.boolean  "fini",                         :default => false, :null => false
    t.float    "pourcent_a_facturer_a_lautre", :default => 50.0,  :null => false
    t.boolean  "revenu",                       :default => false, :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "mouvements", ["balance_id"], :name => "index_mouvements_on_balance_id"
  add_index "mouvements", ["fini"], :name => "index_mouvements_on_fini"
  add_index "mouvements", ["payeur_id", "fini"], :name => "index_mouvements_on_payeur_id_and_fini"
  add_index "mouvements", ["payeur_id", "type_de_mouvement_id", "fini"], :name => "index_mouvements_on_payeur_id_and_type_de_mouvement_id_and_fini"
  add_index "mouvements", ["payeur_id", "type_de_mouvement_id"], :name => "index_mouvements_on_payeur_id_and_type_de_mouvement_id"
  add_index "mouvements", ["payeur_id"], :name => "index_mouvements_on_payeur_id"
  add_index "mouvements", ["type_de_mouvement_id"], :name => "index_mouvements_on_type_de_mouvement_id"

  create_table "texte_de_chats", :force => true do |t|
    t.string   "type_de_texte"
    t.integer  "chat_id"
    t.string   "texte"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "texte_de_chats", ["chat_id"], :name => "index_texte_de_chats_on_chat_id"

  create_table "type_de_mouvements", :force => true do |t|
    t.string   "nom",                           :null => false
    t.integer  "position",                      :null => false
    t.string   "image",                         :null => false
    t.boolean  "revenu",     :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "type_de_mouvements", ["revenu", "position"], :name => "index_type_de_mouvements_on_revenu_and_position"
  add_index "type_de_mouvements", ["revenu"], :name => "index_type_de_mouvements_on_revenu"

  create_table "utilisateurs", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                   :null => false
    t.integer  "chat_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "utilisateurs", ["email"], :name => "index_utilisateurs_on_email", :unique => true
  add_index "utilisateurs", ["reset_password_token"], :name => "index_utilisateurs_on_reset_password_token", :unique => true

end
