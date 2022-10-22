# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController do
  describe '#index' do
    subject(:call) { get :index }

    it 'has to return empty list' do
      call
      expect(response).to be_successful
      expect(parsed[:data].count).to be_zero
    end

    context 'when there are products in a list' do
      let!(:product) { create(:product) }

      it 'has to return list with products' do
        call
        expect(response).to be_successful
        expect(parsed[:data].count).to eq(1)
        expect(parsed[:data].first[:id]).to eq(product.id.to_s)
      end

      context 'when there are products with 0 amount in storage' do
        let!(:product_finished) { create(:product, storage_amount: 0) }

        it 'has to return list with  one product' do
          call
          expect(response).to be_successful
          expect(parsed[:data].count).to eq(1)
          expect(Product.count).to eq(2)
        end
      end
    end
  end
end
