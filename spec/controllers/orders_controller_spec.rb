# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController do
  describe '#new' do
    subject(:call) { get :new, params: { customer_id: customer.id } }

    let(:customer) { create(:customer) }

    it 'has to create a new order and return it' do
      expect { call }.to change { Order.count }.from(0).to(1)
    end

    context 'when user has open order' do
      let!(:order) { create(:order) }
      let(:customer) { order.customer }

      it 'has to return error' do
        call
        expect(response.status).to eq(403)
      end
    end
  end

  describe '#create' do
    subject(:call) { post :create, params: { id: order.id } }

    let(:order) { create(:order) }

    it 'has to return error for blank order' do
      call
      expect(response.status).to eq(403)
    end

    context 'when user added products for order' do
      let!(:order_product) { create(:order_product, order: order) }

      it 'has to change status and return an order' do
        call
        expect(response).to be_successful
        expect(order.reload.status).to eq('submitted')
        expect(parsed[:data][:id]).to eq(order.id.to_s)
      end
    end
  end

  describe '#update' do
    subject(:call) { put :update, params: { id: order.id } }

    let(:order_product) { create(:order_product) }
    let(:order) { order_product.order }

    before { order.submitted! }

    it 'has to change status and return an order' do
      call
      expect(response).to be_successful
      expect(order.reload.status).to eq('in_process')
      expect(parsed[:data][:id]).to eq(order.id.to_s)
    end

  end

  describe '#destroy' do
    subject(:call) { delete :destroy, params: { id: order.id } }

    let(:order) { create(:order) }

    it 'has to change status of an order' do
      call
      expect(response).to be_successful
      expect(order.reload.status).to eq('rejected')
    end
  end
end
