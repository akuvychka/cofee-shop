# frozen_string_literal: true

# Modal for the product combo
class Combo < ApplicationRecord
  has_many :product_combos, dependent: :destroy
  has_many :products, through: :product_combos
end
