# frozen_string_literal: true

# Modal for the discount for the project
class Discount < ApplicationRecord
  enum discount_type: %i[amount percent]
end
