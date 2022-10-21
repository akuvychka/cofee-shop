# frozen_string_literal: true

# Modal for the products that included to combo and discounts
class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order
end
