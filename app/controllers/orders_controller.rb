# frozen_string_literal: true

# Controller for combo products
class OrdersController < ApplicationController
  before_action :find_order, only: %i[create update destroy]
  before_action :validate_order_products, only: :create
  before_action :check_existing_orders, only: :new
  def new
    order = Order.create({ customer_id: params[:customer_id] })

    render json: OrderSerializer.new(order).serializable_hash
  end

  def create
    @order.submitted!

    render json: OrderSerializer.new(
      @order,
      include: [:order_products]
    ).serializable_hash
  end

  def update
    @order.next_status

    render json: OrderSerializer.new(
      @order,
      include: [:order_products]
    ).serializable_hash
  end

  def destroy
    @order.rejected!

    head :no_content
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def validate_order_products
    return unless @order.order_products.blank?

    render json: { message: 'You have to choose some product for submit' }, status: :forbidden
  end

  def check_existing_orders
    return if Order.where(customer_id: params[:customer_id], status: :open).blank?

    render json: { message: 'You have open order' }, status: :forbidden
  end
end
