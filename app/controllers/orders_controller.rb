# frozen_string_literal: true

# Controller for combo products
class OrdersController < ApplicationController
  before_action :find_order, only: :destroy
  def new
    order = Order.create(params[:customer_id])

    render json: OrderSerializer.new(order).serializable_hash
  end

  def destroy
    @order.rejected!

    render status: :ok
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
end
