# frozen_string_literal: true

# Modal for the orders
class Order < ApplicationRecord
  enum status: %i[new submitted in_process done recieved rejected]

  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products
end
