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

ActiveRecord::Schema.define(version: 2019_11_25_054557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.string "favoritor_type", null: false
    t.bigint "favoritor_id", null: false
    t.string "scope", default: "favorite", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked"], name: "index_favorites_on_blocked"
    t.index ["favoritable_id", "favoritable_type"], name: "fk_favoritables"
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["favoritor_id", "favoritor_type"], name: "fk_favorites"
    t.index ["favoritor_type", "favoritor_id"], name: "index_favorites_on_favoritor_type_and_favoritor_id"
    t.index ["scope"], name: "index_favorites_on_scope"
  end

  create_table "histories", force: :cascade do |t|
    t.boolean "favorite", default: false
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_histories_on_product_id"
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "barcode"
    t.string "name"
    t.text "ingredients"
    t.string "label_photo"
    t.text "label_text"
    t.string "front_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restriction_tags", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "restriction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_restriction_tags_on_product_id"
    t.index ["restriction_id"], name: "index_restriction_tags_on_restriction_id"
  end

  create_table "restrictions", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_restrictions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "restriction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restriction_id"], name: "index_user_restrictions_on_restriction_id"
    t.index ["user_id"], name: "index_user_restrictions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "histories", "products"
  add_foreign_key "histories", "users"
  add_foreign_key "restriction_tags", "products"
  add_foreign_key "restriction_tags", "restrictions"
  add_foreign_key "user_restrictions", "restrictions"
  add_foreign_key "user_restrictions", "users"
end
