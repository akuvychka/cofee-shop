# frozen_string_literal: true

# Serializer for a products combos
class ComboSerializer < BaseSerializer
  set_type :combo

  attributes :name, :full_price

  has_many :products
end
