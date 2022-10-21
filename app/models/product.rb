# frozen_string_literal: true

# Modal for the main product
class Product < ApplicationRecord
  validate :tax_rate_value

  has_many :product_combos, dependent: :destroy
  has_many :combos, through: :product_combos

  def tax_rate_value
    return if tax_rate in (0..1)

    errors.add(:alert, 'tax has to be in a range 0..1')
  end
end
