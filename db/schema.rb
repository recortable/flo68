# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100925120505) do

  create_table "cartels", :force => true do |t|
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "position"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "video_id"
    t.string   "body",         :limit => 1024
    t.string   "email"
    t.string   "author"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "name",       :limit => 32
    t.string   "title",      :limit => 128
    t.string   "body",       :limit => 4096
    t.string   "video",      :limit => 1024
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["name"], :name => "index_sections_on_name"

  create_table "tutorials", :force => true do |t|
    t.string   "planos_generator",  :limit => 32
    t.string   "ensayos_generator", :limit => 32
    t.string   "elpalo_generator",  :limit => 32
    t.string   "planos_url",        :limit => 1000
    t.string   "ensayos_url",       :limit => 1000
    t.string   "elpalo_url",        :limit => 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.integer  "section_id"
    t.string   "title"
    t.string   "url",                    :limit => 1024
    t.string   "generator",                              :default => "vimeo"
    t.string   "animation_file_name"
    t.string   "animation_content_type"
    t.integer  "animation_file_size"
    t.datetime "animation_updated_at"
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
