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

ActiveRecord::Schema.define(:version => 20110423101523) do

  create_table "deploy_states", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "license_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_modules", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "license_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_versions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "remarks"
    t.integer  "user_id"
    t.integer  "deploy_state_id"
    t.integer  "product_module_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_cases", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "criteria"
    t.integer  "product_module_id"
    t.integer  "test_environment_id"
    t.integer  "estimated_time"
    t.integer  "test_step_id"
    t.integer  "test_suite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_environments", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_result_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_run_suites", :force => true do |t|
    t.integer  "test_suite_id"
    t.text     "remarks"
    t.integer  "user_id"
    t.integer  "deploy_state_id"
    t.datetime "when"
    t.integer  "test_result_type_id"
    t.integer  "time_estimated"
    t.integer  "time_needed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_steps", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "smoketest"
    t.text     "criteria"
    t.integer  "product_module_id"
    t.integer  "test_case_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_suites", :force => true do |t|
    t.integer  "product_version_id"
    t.text     "remarks"
    t.integer  "user_id"
    t.date     "closed"
    t.integer  "test_case_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
