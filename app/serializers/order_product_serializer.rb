# frozen_string_literal: true

# Serializer for products in order
class OrderProductSerializer < BaseSerializer
  set_type :order_product

  attribute :amount

  attribute :name do |order_product|
    order_product.product.name
  end
end
