# frozen_string_literal: true

# Modal for the product combo
class Combo < ApplicationRecord
  has_many :product_combos, dependent: :destroy
  has_many :products, through: :product_combos
  scope :available, -> { includes(:product_combos).includes(:products).where(active: true) }

  def full_price
    0
  end
end
