# frozen_string_literal: true

# Job for notify customer when order done
class SendOrderReadyNotificationJob < ApplicationJob
  queue_as :default

  def perform(*order_id)
    o = Order.find_by_id(order_id)
    o.received!
  end
end
