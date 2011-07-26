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

ActiveRecord::Schema.define(:version => 20110726163315) do

  create_table "campaigns", :force => true do |t|
    t.string   "name",              :limit => 50
    t.date     "start_date"
    t.date     "end_date"
    t.date     "register_due_date"
    t.integer  "course_id"
    t.integer  "trainer_id"
    t.string   "status",            :limit => 50, :default => "open"
    t.decimal  "price"
    t.decimal  "discount_price"
    t.integer  "training_room_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogs", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "enabled",           :default => true
    t.integer  "parent_catalog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogs_courses", :id => false, :force => true do |t|
    t.integer "catalog_id", :null => false
    t.integer "course_id",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "course_name"
    t.string   "version"
    t.string   "status"
    t.text     "short_description"
    t.text     "long_description"
    t.integer  "duration_in_hours"
    t.integer  "total_rating"
    t.decimal  "price"
    t.decimal  "discount_price"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "key_numbers", :force => true do |t|
    t.string   "name"
    t.string   "pattern"
    t.integer  "next_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "city",          :limit => 50
    t.string   "address",       :limit => 200
    t.string   "zip",           :limit => 20
    t.string   "contact_phone", :limit => 50
    t.string   "map_url",       :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "campaign_id"
    t.integer  "qty"
    t.decimal  "price"
    t.decimal  "discount_price"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "joiner_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "order_code",    :limit => 20
    t.integer  "user_id"
    t.decimal  "total_amount"
    t.string   "status",        :limit => 20
    t.boolean  "payable",                     :default => false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campaign_id"
    t.datetime "paid_time"
    t.text     "reason"
    t.datetime "paid_date"
    t.datetime "refunded_date"
  end

  create_table "payments", :force => true do |t|
    t.string   "notify_id"
    t.datetime "notify_time"
    t.string   "trade_no"
    t.string   "trade_status"
    t.decimal  "total_amount"
    t.string   "buyer_email"
    t.text     "raw_post"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "out_trade_no"
    t.datetime "gmt_create"
    t.datetime "gmt_payment"
    t.boolean  "use_coupon"
    t.string   "subject"
    t.string   "body"
    t.decimal  "price"
    t.decimal  "quantity"
    t.string   "sign_type"
    t.string   "sign"
    t.string   "notify_type"
    t.integer  "order_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id", :null => false
    t.integer "user_id", :null => false
  end

  create_table "user_details", :force => true do |t|
    t.integer  "user_id"
    t.string   "id_card",      :limit => 20
    t.date     "birthday"
    t.string   "company",      :limit => 100
    t.string   "title",        :limit => 20
    t.string   "company_size", :limit => 50
    t.string   "address",      :limit => 200
    t.string   "zip",          :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",     :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "username",               :limit => 20
    t.string   "gender",                 :limit => 20,  :default => "male"
    t.string   "true_name",              :limit => 20
    t.string   "contact_phone",          :limit => 20
    t.string   "role",                   :limit => 20,  :default => "user"
    t.string   "reference_to",           :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
