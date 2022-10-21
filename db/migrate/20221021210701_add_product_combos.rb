# frozen_string_literal: true

class AddProductCombos < ActiveRecord::Migration[7.0]
  def change
    create_table :product_combos do |t|
      t.integer :product_id, null: false
      t.integer :combo_id, null: false
      t.integer :discount_id
    end
  end
end
