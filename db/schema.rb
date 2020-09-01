# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_31_152429) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claimed_project_stats", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "record_time"
    t.integer "bigint"
    t.integer "project_stage"
    t.bigint "claimed_project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["claimed_project_id"], name: "index_claimed_project_stats_on_claimed_project_id"
  end

  create_table "claimed_projects", force: :cascade do |t|
    t.integer "claimed_user_id"
    t.boolean "claimed", default: false
    t.boolean "completed", default: false
    t.time "time_spent"
    t.float "rate"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_claimed_projects_on_project_id"
  end

  create_table "milestone_subtasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "project_milestone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_milestone_id"], name: "index_milestone_subtasks_on_project_milestone_id"
  end

  create_table "project_categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_milestones", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.time "alloted_time"
    t.time "time_spent"
    t.bigint "claimed_project_id", null: false
    t.bigint "project_stage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["claimed_project_id"], name: "index_project_milestones_on_claimed_project_id"
    t.index ["project_stage_id"], name: "index_project_milestones_on_project_stage_id"
  end

  create_table "project_stages", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "share"
    t.time "estimated_time"
    t.bigint "claimed_project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["claimed_project_id"], name: "index_project_stages_on_claimed_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "budget"
    t.integer "owned_user_id"
    t.string "skill_set"
    t.boolean "request_share", default: false
    t.boolean "claimed", default: false
    t.boolean "completed", default: false
    t.string "attachment_url"
    t.bigint "project_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_category_id"], name: "index_projects_on_project_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.integer "status"
    t.string "profile_image"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "claimed_project_stats", "claimed_projects"
  add_foreign_key "claimed_projects", "projects"
  add_foreign_key "milestone_subtasks", "project_milestones"
  add_foreign_key "project_milestones", "claimed_projects"
  add_foreign_key "project_milestones", "project_stages"
  add_foreign_key "project_stages", "claimed_projects"
  add_foreign_key "projects", "project_categories"
end
