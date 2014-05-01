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

ActiveRecord::Schema.define(:version => 20140501085313) do

  create_table "assignments", :force => true do |t|
    t.integer  "course_id"
    t.integer  "instructor_id"
    t.integer  "contract_fee",  :null => false
    t.string   "position",      :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "bookings", :force => true do |t|
    t.integer  "course_id"
    t.integer  "classroom_id"
    t.date     "start_date",   :null => false
    t.date     "end_date",     :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "bookings", ["course_id"], :name => "index_bookings_on_course_id", :unique => true

  create_table "classrooms", :force => true do |t|
    t.string   "name",          :null => false
    t.text     "equipment"
    t.text     "other_aspects"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.string   "start_time",  :null => false
    t.string   "end_time",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.boolean  "paid_deposit", :default => false
    t.string   "pre_work",     :default => "No"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                             :null => false
    t.string   "first_name",                           :null => false
    t.string   "last_name",                            :null => false
    t.string   "role",            :default => "guest", :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "password_digest"
  end

  add_index "users", ["username"], :name => "index_people_on_username", :unique => true

end
