# frozen_string_literal: true

class AddCombos < ActiveRecord::Migration[7.0]
  def change
    create_table :combos do |t|
      t.string :name
    end
  end
end
