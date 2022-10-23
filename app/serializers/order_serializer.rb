# frozen_string_literal: true

# Serializer for order
class OrderSerializer < BaseSerializer
  set_type :order

  attribute :final_price

  has_many :order_products
end
