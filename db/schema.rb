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

ActiveRecord::Schema.define(version: 2019_06_23_210825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billing_addresses", force: :cascade do |t|
    t.string "address_1"
    t.string "address_2"
    t.string "zipcode"
    t.string "city"
    t.string "phone"
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.index ["user_id"], name: "index_billing_addresses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "main_category_id"
    t.string "slug"
    t.index ["main_category_id"], name: "index_categories_on_main_category_id"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "admin_name"
    t.string "address_1"
    t.string "address_2"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.boolean "subject_vat", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "site_name"
    t.string "siret"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "message_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customizations", force: :cascade do |t|
    t.string "main_image", default: "https://s3.eu-west-3.amazonaws.com/shopsuper/landing.jpg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "delivery"
    t.text "secure_payment"
    t.text "general_condition_of_sales"
    t.text "legal_notice"
    t.text "confidentiality_policy"
    t.text "cookies_policy"
    t.string "navbar_color", default: "#FFFFFF"
    t.string "body_color", default: "#FFFFFF"
    t.string "nav_links_color", default: "#AAAAAA"
    t.string "btn_main_color", default: "#111"
    t.string "btn_secondary_color", default: "#FFFF"
    t.string "text_color", default: "#111"
    t.string "main_btn_text_color", default: "#FFF"
    t.string "secondary_btn_text_color", default: "#111"
    t.string "text_main_image"
    t.string "text_btn_main_image"
    t.string "second_image"
    t.string "third_image"
    t.string "text_second_image"
    t.string "text_btn_second_image"
    t.string "text_third_image"
    t.string "text_btn_third_image"
    t.string "logo"
    t.string "main_link"
    t.string "second_link"
    t.string "third_link"
    t.string "logo_banner"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "main_categories", force: :cascade do |t|
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.bigint "variant_id"
    t.float "weight"
    t.boolean "selected", default: false
    t.integer "missing_quantity", default: 0
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["variant_id"], name: "index_order_items_on_variant_id"
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
    t.float "total_weight"
    t.date "return_limit_date"
    t.boolean "return_asked", default: false
    t.string "charge_id"
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
    t.integer "supplier_id"
    t.float "weight"
    t.string "qr_code"
    t.string "slug"
    t.integer "discount_percentage", default: 0
    t.decimal "discounted_price", default: "0.0"
    t.decimal "market_price"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["slug"], name: "index_products_on_slug", unique: true
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "returning_items", force: :cascade do |t|
    t.bigint "returning_id"
    t.bigint "variant_id"
    t.bigint "order_item_id"
    t.string "state"
    t.boolean "selected", default: false
    t.decimal "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_item_id"], name: "index_returning_items_on_order_item_id"
    t.index ["returning_id"], name: "index_returning_items_on_returning_id"
    t.index ["variant_id"], name: "index_returning_items_on_variant_id"
  end

  create_table "returnings", force: :cascade do |t|
    t.string "number"
    t.date "limit_date"
    t.integer "status"
    t.bigint "order_id"
    t.text "reason"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_returnings_on_order_id"
    t.index ["user_id"], name: "index_returnings_on_user_id"
  end

  create_table "sale_items", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.integer "quantity", null: false
    t.decimal "market_price", precision: 15, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "variant_id"
    t.index ["sale_id"], name: "index_sale_items_on_sale_id"
    t.index ["variant_id"], name: "index_sale_items_on_variant_id"
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "sub_total"
    t.bigint "user_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_cents", default: 0, null: false
    t.integer "status"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "zipcode"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "country"
    t.index ["user_id"], name: "index_shipping_addresses_on_user_id"
  end

  create_table "stickers", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_stickers_on_product_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "variant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "initial_quantity"
    t.bigint "supplier_id"
    t.decimal "cost_price"
    t.decimal "price"
    t.decimal "discount", default: "0.0"
    t.decimal "market_price"
    t.index ["supplier_id"], name: "index_stocks_on_supplier_id"
    t.index ["variant_id"], name: "index_stocks_on_variant_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "company"
    t.string "address"
    t.string "zipcode"
    t.string "country"
    t.string "city"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "gender", default: true
    t.string "birth_date"
    t.string "email_confirmation"
    t.boolean "list_subscriber", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.string "color"
    t.string "size"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "users"
  add_foreign_key "order_items", "orders", name: "fk_order_items_to_order"
  add_foreign_key "order_items", "variants"
  add_foreign_key "returning_items", "returnings"
  add_foreign_key "sale_items", "sales", name: "fk_sale_items_to_sale"
  add_foreign_key "sale_items", "variants"
  add_foreign_key "sales", "users"
  add_foreign_key "stocks", "suppliers"
  add_foreign_key "stocks", "variants"
  add_foreign_key "variants", "products"
end
