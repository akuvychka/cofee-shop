# frozen_string_literal: true

# Modal for the orders
class Order < ApplicationRecord
  enum status: %i[open submitted in_process done received rejected]
  validate :status, :validate_state

  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products

  def on_order_change
    # TODO: add logic for update total_price
  end

  def next_status
    update(status: Order.statuses[status] + 1)
    reload
  end

  private

  # rubocop:disable Metrics/AbcSize
  def validate_state
    case status_was
    when 'open'
      errors.add(:status, 'Unexpected transition') unless %w[open submitted rejected].include?(status)
    when 'received'
      errors.add(:status, 'Unexpected transition')
    when 'rejected'
      errors.add(:status, 'Unexpected transition')
    else
      errors.add(:status, 'Unexpected transition') unless Order.statuses[status] - Order.statuses[status_was] == 1
    end
  end
  # rubocop:enable Metrics/AbcSize
end
