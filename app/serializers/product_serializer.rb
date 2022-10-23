# frozen_string_literal: true

# Serializer for products that provides cofee shop
class ProductSerializer < BaseSerializer
  set_type :product

  attributes :name, :price, :tax_rate

  has_many :combos
end
