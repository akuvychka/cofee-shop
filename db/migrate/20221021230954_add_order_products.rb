class AddOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :amount, null: false
    end
  end
end
