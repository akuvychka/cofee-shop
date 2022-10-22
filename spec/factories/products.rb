# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { FFaker::Lorem.word }
    price { rand(100) }
    tax_rate { rand }
    storage_amount { rand(1..10) }
  end
end
