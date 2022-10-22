class AddActiveToCombos < ActiveRecord::Migration[7.0]
  def change
    add_column :combos, :active, :boolean, default: true
  end
end
