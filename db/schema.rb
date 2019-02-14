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

ActiveRecord::Schema.define(version: 2019_02_15_164927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billing_addresses", force: :cascade do |t|
    t.string "phone"
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "locality"
    t.string "route"
    t.string "administrative_area_level_1"
    t.integer "postal_code"
    t.integer "street_number"
    t.index ["user_id"], name: "index_billing_addresses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customizations", force: :cascade do |t|
    t.string "main_image", default: "https://s3-eu-west-1.amazonaws.com/mygasoline/landing.jpg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "delivery"
    t.text "secure_payment"
    t.text "general_condition_of_sales"
    t.text "legal_notice"
    t.text "confidentiality_policy"
    t.text "cookies_policy"
    t.string "navbar_color", default: "#fff"
    t.string "body_color", default: "#fff"
    t.string "nav_links_color", default: "#6D6B6B"
    t.string "btn_main_color", default: "#111"
    t.string "btn_secondary_color", default: "#fff"
    t.string "text_color", default: "#111"
    t.string "main_btn_text_color", default: "#fff"
    t.string "secondary_btn_text_color", default: "#111"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.bigint "size_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["size_id"], name: "index_order_items_on_size_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "token"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "payment"
    t.integer "user_id"
    t.integer "total_cents", default: 0, null: false
    t.decimal "sub_total"
    t.decimal "shipping_fees"
    t.boolean "gcos_accepted", default: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title", limit: 150, null: false
    t.text "description"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.integer "user_id"
    t.json "attachments"
    t.string "brand"
    t.string "ref"
    t.decimal "price"
    t.decimal "buying_price", precision: 10, scale: 2
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "locality"
    t.string "route"
    t.string "administrative_area_level_1"
    t.integer "postal_code"
    t.integer "street_number"
    t.string "phone"
    t.index ["user_id"], name: "index_shipping_addresses_on_user_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "size_name"
    t.integer "quantity"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sizes_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "gender", default: true
    t.string "birth_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "users"
  add_foreign_key "order_items", "orders", name: "fk_order_items_to_order"
  add_foreign_key "order_items", "sizes"
  add_foreign_key "sizes", "products"
end
