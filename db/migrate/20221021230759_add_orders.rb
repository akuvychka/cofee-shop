class AddOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :status, null: false
      t.integer :user_id, null: false
      t.decimal :final_price, default: 0
    end
  end
end
