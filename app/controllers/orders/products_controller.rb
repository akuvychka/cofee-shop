# frozen_string_literal: true

# Controller for combo products
class ProductsController < ApplicationController
  before_action :find_order_product

  def update
    if @order_product.present?
      @order_product.update(count: @order_product.count + 1)
    else
      OrderProduct.create(order_id: params[:order_id], product_id: params[:id], count: 1)
    end
    find_order

    render json: OrderSerializer.new(@order).serializable_hash
  end

  def destroy
    @order_product.destroy if @order_product.present?
    find_order

    render json: OrderSerializer.new(@order).serializable_hash
  end

  private

  def find_order
    @order = Order.find(params[:order_id])
  end

  def find_order_product
    @order_product = OrderProduct.find_by_id(params[:id])
  end
end
