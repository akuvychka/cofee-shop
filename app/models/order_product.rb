# frozen_string_literal: true

# Modal for the products that included to combo and discounts
class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  after_save :update_order
  after_destroy :update_order

  private

  def update_order
    order.on_order_change
  end
end
