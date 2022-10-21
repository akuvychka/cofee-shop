# frozen_string_literal: true

# Modal for the products that included to combo and discounts
class ProductCombo < ApplicationRecord
  belongs_to :product
  belongs_to :combo
  belongs_to :discount
end
