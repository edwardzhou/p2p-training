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

ActiveRecord::Schema.define(:version => 20110328034302) do

  create_table "catalogs", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "enabled",           :default => true
    t.integer  "parent_catalog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "course_name"
    t.string   "version"
    t.string   "status"
    t.text     "short_description"
    t.text     "long_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_catalogs", :id => false, :force => true do |t|
    t.integer "course_id",  :null => false
    t.integer "catalog_id", :null => false
  end

  create_table "user_details", :force => true do |t|
    t.integer  "user_id"
    t.string   "id_card",      :limit => 20
    t.date     "birthday"
    t.string   "company",      :limit => 100
    t.string   "company_size", :limit => 50
    t.string   "address",      :limit => 200
    t.string   "zip",          :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",     :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",     :null => false
    t.string   "password_salt",                       :default => "",     :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "nick_name",            :limit => 20
    t.string   "gender",               :limit => 20,  :default => "male"
    t.string   "true_name",            :limit => 20
    t.string   "contact_phone",        :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["nick_name"], :name => "index_users_on_nick_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
