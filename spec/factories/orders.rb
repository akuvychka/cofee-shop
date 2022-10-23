# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    customer
    status { :open }
    final_price { 0 }
  end
end
