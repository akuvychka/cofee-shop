# frozen_string_literal: true

# Controller for products
class ProductsController < ApplicationController
  def index
    render json: ProductSerializer.new(
      Product.where(select_query).includes(:combos),
      {
        include: [:combos],
        fields: { combo: %i[id name] }
      }
    ).serializable_hash
  end

  private

  def select_query
    "storage_amount > 0#{params[:search] ? " AND name like '%#{params[:search]}%'" : ''}"
  end
end
