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

ActiveRecord::Schema[7.0].define(version: 2022_10_22_170841) do
  create_table "combos", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.integer "contact_type"
    t.string "contact"
  end

  create_table "discounts", force: :cascade do |t|
    t.integer "discount_type", null: false
    t.decimal "amount", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "amount", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status", null: false
    t.integer "user_id", null: false
    t.decimal "final_price", default: "0.0"
  end

  create_table "product_combos", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "combo_id", null: false
    t.integer "discount_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.decimal "tax_rate"
    t.integer "storage_amount", default: 0
  end

end
