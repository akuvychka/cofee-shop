# frozen_string_literal: true

class AddProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.decimal :tax_rate
      t.integer :storage_amount, default: 0
    end
  end
end
