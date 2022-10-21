# frozen_string_literal: true

class AddDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.integer :discount_type, null: false
      t.decimal :amount, null: false
    end
  end
end
