# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CombosController do
  describe '#index' do
    subject(:call) { get :index }

    it 'has to return empty list' do
      call
      expect(response).to be_successful
      expect(parsed[:data].count).to be_zero
    end

    context 'when there are products in a list' do
      let!(:combo) { create(:combo) }

      it 'has to return list with products' do
        call
        expect(response).to be_successful
        expect(parsed[:data].count).to eq(1)
        expect(parsed[:data].first[:id]).to eq(combo.id.to_s)
      end

      context 'when there are products with 0 amount in storage' do
        let!(:inactive_combo) { create(:combo, active: false) }

        it 'has to return list with  one product' do
          call
          expect(response).to be_successful
          expect(parsed[:data].count).to eq(1)
          expect(Combo.count).to eq(2)
        end
      end
    end
  end
end
