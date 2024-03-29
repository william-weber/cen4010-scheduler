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

ActiveRecord::Schema.define(:version => 20120422234624) do

  create_table "course_request_courses", :force => true do |t|
    t.integer  "rank"
    t.integer  "course_request_id"
    t.integer  "course_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "time"
    t.string   "day"
  end

  create_table "course_requests", :force => true do |t|
    t.string   "season"
    t.integer  "year"
    t.integer  "user_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "number_of_courses"
    t.boolean  "course_release_expected"
    t.boolean  "sabbatical_expected"
    t.boolean  "dev_leave_expected"
    t.integer  "course_preference_rank"
    t.integer  "days_of_week_rank"
    t.integer  "times_of_day_rank"
    t.integer  "morning_rank"
    t.integer  "afternoon_rank"
    t.integer  "evening_rank"
    t.integer  "summer_term_preference"
    t.integer  "days_of_week_preference"
    t.string   "type"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.integer  "degree_program_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "offered_odd_fall"
    t.boolean  "offered_even_spring"
    t.boolean  "offered_even_fall"
    t.boolean  "offered_odd_spring"
  end

  create_table "degree_programs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "report_users", :force => true do |t|
    t.integer "user_id"
    t.string  "day"
    t.string  "time"
    t.integer "rank"
    t.integer "report_id"
    t.integer "course_id"
    t.string  "request_type"
  end

  create_table "reports", :force => true do |t|
    t.string   "type"
    t.datetime "date_run"
    t.integer  "course_id"
    t.string   "day"
    t.string   "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "season"
    t.integer  "year"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "degree_program_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "n_number"
    t.boolean  "is_student",             :default => true
    t.boolean  "is_faculty",             :default => false
    t.boolean  "is_admin",               :default => false
    t.boolean  "is_secretary",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["n_number"], :name => "index_users_on_n_number", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
