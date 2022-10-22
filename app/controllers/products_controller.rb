# frozen_string_literal: true

# Controller for products
class ProductsController < ApplicationController
  def index
    render json: ProductSerializer.new(
      Product.where('storage_amount > 0').includes(:combos),
      {
        include: [:combos]
      }
    ).serializable_hash
  end
end