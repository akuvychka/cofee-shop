# frozen_string_literal: true

module Orders
  # Controller for combo products
  class ProductsController < ApplicationController
    before_action :find_order_product

    def create
      if @order_product.present?
        @order_product.update(amount: @order_product.amount + 1)
      else
        OrderProduct.create(order_id: params[:order_id], product_id: params[:id], amount: 1)
      end
      find_order

      render json: OrderSerializer.new(
        @order,
        include: [:order_products]
      ).serializable_hash
    end

    def destroy
      update_product_on_destroy
      find_order

      render json: OrderSerializer.new(
        @order,
        include: [:order_products]
      ).serializable_hash
    end

    private

    def find_order
      @order = Order.find(params[:order_id])
    end

    def find_order_product
      @order_product = OrderProduct.find_by(product_id: params[:id], order_id: params[:order_id])
    end

    def update_product_on_destroy
      return unless @order_product.present?

      if @order_product.amount > 1
        @order_product.update(amount: @order_product.amount - 1)
      else
        @order_product.destroy
      end
    end
  end
end
