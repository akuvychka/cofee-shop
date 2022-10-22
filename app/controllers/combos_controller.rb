# frozen_string_literal: true

# Controller for combo products
class CombosController < ApplicationController
  def index
    render json: ComboSerializer.new(
      Combo.available,
      {
        include: [:products],
        fields: { product: %i[id name] }
      }
    ).serializable_hash
  end
end
