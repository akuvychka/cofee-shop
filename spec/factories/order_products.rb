# frozen_string_literal: true

FactoryBot.define do
  factory :order_product do
    order
    product
    amount { 1 }
  end
end
