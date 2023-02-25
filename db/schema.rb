# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_25_140106) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "income_type"
    t.bigint "family_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "born_date"
    t.datetime "slaughter_date"
    t.string "crotal"
    t.string "lot"
    t.float "weight"
    t.float "weight_without_bones"
    t.float "weight_bones"
    t.float "temperature"
    t.decimal "total_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_channels_on_family_id"
    t.index ["supplier_id"], name: "index_channels_on_supplier_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cut_names", force: :cascade do |t|
    t.string "name"
    t.bigint "piece_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_cut_names_on_piece_id"
  end

  create_table "cut_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuts", force: :cascade do |t|
    t.bigint "piece_id", null: false
    t.bigint "cut_name_id", null: false
    t.date "start_date_maturation"
    t.date "end_date_maturation"
    t.boolean "maturing"
    t.boolean "available"
    t.bigint "cut_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cut_name_id"], name: "index_cuts_on_cut_name_id"
    t.index ["cut_type_id"], name: "index_cuts_on_cut_type_id"
    t.index ["piece_id"], name: "index_cuts_on_piece_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "product_cut_id", null: false
    t.integer "quantity"
    t.integer "waste"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_cut_id"], name: "index_inventories_on_product_cut_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
  end

  create_table "name_of_products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "piece_names", force: :cascade do |t|
    t.string "name"
    t.bigint "family_id", null: false
    t.string "lot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_piece_names_on_family_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "piece_name_id", null: false
    t.integer "weight"
    t.integer "final_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_pieces_on_channel_id"
    t.index ["piece_name_id"], name: "index_pieces_on_piece_name_id"
  end

  create_table "processed_products", force: :cascade do |t|
    t.bigint "name_of_products_id", null: false
    t.bigint "product_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_of_products_id"], name: "index_processed_products_on_name_of_products_id"
    t.index ["product_type_id"], name: "index_processed_products_on_product_type_id"
  end

  create_table "product_cuts", force: :cascade do |t|
    t.bigint "cut_id", null: false
    t.bigint "processed_products_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cut_id"], name: "index_product_cuts_on_cut_id"
    t.index ["processed_products_id"], name: "index_product_cuts_on_processed_products_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_details", force: :cascade do |t|
    t.bigint "sales_id", null: false
    t.bigint "product_cut_id", null: false
    t.integer "quantity"
    t.float "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_cut_id"], name: "index_sale_details_on_product_cut_id"
    t.index ["sales_id"], name: "index_sale_details_on_sales_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_sales_on_invoice_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "nit"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "channels", "families"
  add_foreign_key "channels", "suppliers"
  add_foreign_key "cut_names", "pieces"
  add_foreign_key "cuts", "cut_names"
  add_foreign_key "cuts", "cut_types"
  add_foreign_key "cuts", "pieces"
  add_foreign_key "inventories", "product_cuts"
  add_foreign_key "invoices", "customers"
  add_foreign_key "piece_names", "families"
  add_foreign_key "pieces", "channels"
  add_foreign_key "pieces", "piece_names"
  add_foreign_key "processed_products", "name_of_products", column: "name_of_products_id"
  add_foreign_key "processed_products", "product_types"
  add_foreign_key "product_cuts", "cuts"
  add_foreign_key "product_cuts", "processed_products", column: "processed_products_id"
  add_foreign_key "sale_details", "product_cuts"
  add_foreign_key "sale_details", "sales", column: "sales_id"
  add_foreign_key "sales", "invoices"
end
