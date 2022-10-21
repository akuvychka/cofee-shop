# frozen_string_literal: true

# Modal for the shop customer
class Customer < ApplicationRecord
  enum contact_type: %i[phone email]
  has_many :orders
end
