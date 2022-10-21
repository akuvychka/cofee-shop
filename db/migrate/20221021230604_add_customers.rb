# frozen_string_literal: true

class AddCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.integer :contact_type
      t.string :contact
    end
  end
end
