# frozen_string_literal: true

# Serializer for order
class OrderSerializer < BaseSerializer
  set_type :order

  attributes :final_price, :status

  has_many :order_products
end
