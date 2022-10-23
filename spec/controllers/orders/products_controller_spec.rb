# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orders::ProductsController do
  describe '#create' do
    subject(:call) { post :create, params: { order_id: order.id, id: product.id } }

    let(:order) { create(:order) }
    let(:product) { create(:product) }

    it 'has to return order with included product' do
      call
      expect(response).to be_successful
      expect(parsed[:data][:type]).to eq('order')
      expect(parsed[:data][:relationships][:order_products][:data].length).to eq(1)
    end

    context 'when product already included' do
      before do
        create(:order_product, product: product, order: order)
      end

      it 'has to return list with product and increase count of it' do
        call
        expect(response).to be_successful
        expect(parsed[:data][:type]).to eq('order')
        expect(parsed[:data][:relationships][:order_products][:data].length).to eq(1)
        expect(parsed[:included].first[:type]).to eq('order_product')
        expect(parsed[:included].first[:attributes][:amount]).to eq(2)
      end
    end
  end

  describe '#destroy' do
    subject(:call) { delete :destroy, params: { order_id: order.id, id: product.id } }

    let(:order) { order_product.order }
    let(:product) { order_product.product }
    let(:order_product) { create(:order_product) }

    it 'has to return order without included product' do
      call
      expect(response).to be_successful
      expect(parsed[:data][:type]).to eq('order')
      expect(parsed[:data][:relationships][:order_products][:data].length).to be_zero
    end

    context 'when product already included several times' do
      let(:order_product) { create(:order_product, amount: 2) }

      it 'has to return order without included product' do
        call
        expect(response).to be_successful
        expect(parsed[:data][:type]).to eq('order')
        expect(parsed[:data][:relationships][:order_products][:data].length).to eq(1)
      end
    end
  end
end
