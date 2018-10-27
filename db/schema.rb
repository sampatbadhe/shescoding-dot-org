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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2015_04_13_000426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_resources", id: false, force: :cascade do |t|
    t.integer "resource_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categories_resources_on_category_id"
    t.index ["resource_id"], name: "index_categories_resources_on_resource_id"
  end

  create_table "guides", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "alias"
    t.string "description"
    t.integer "likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guides_steps", id: false, force: :cascade do |t|
    t.integer "guide_id"
    t.integer "step_id"
    t.index ["guide_id"], name: "index_guides_steps_on_guide_id"
    t.index ["step_id"], name: "index_guides_steps_on_step_id"
  end

  create_table "personas", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.text "description"
    t.json "questions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "description"
    t.string "source"
    t.datetime "date"
    t.boolean "public"
    t.integer "likes", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", id: :serial, force: :cascade do |t|
    t.string "type"
    t.text "content"
    t.string "level"
    t.integer "likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

end
