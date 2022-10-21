require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#validations' do
    context 'tax_rate' do
      subject(:product) { Product.new({ price: rand(800), name: FFaker::Lorem.word, tax_rate: tax_rate }) }

      let(:tax_rate) { 0.5 }

      it { is_expected.to be_valid }

      context 'when tax_rate is out of range' do
        let(:tax_rate) { 5 }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
