require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#validations' do
    context 'status' do
      subject(:order) { Order.new(customer_id: create(:customer).id) }

      it { is_expected.to be_valid }

      context 'when change status from open' do
        context 'when to submitted' do
          it { expect(order.submitted!).to be(true) }
        end

        context 'when to rejected' do
          it { expect(order.rejected!).to be(true) }
        end

        context 'when to in_process' do
          it 'has to have errors' do
            o = order
            o.status = :in_process
            expect(o).not_to be_valid
          end
        end

        context 'when to done' do
          it 'has to have errors' do
            o = order
            o.status = :done
            expect(o).not_to be_valid
          end
        end

        context 'when to received' do
          it 'has to have errors' do
            o = order
            o.status = :received
            expect(o).not_to be_valid
          end
        end
      end
    end

    context 'when change status from submitted' do
      subject(:order) do
        o = Order.create(customer_id: create(:customer).id)
        o.submitted!
        o
      end

      context 'when to in_process' do
        it { expect(order.in_process!).to be(true) }
      end

      context 'when to open' do
        it 'has to have errors' do
          o = order
          o.status = :open
          expect(o).not_to be_valid
        end
      end

      context 'when to done' do
        it 'has to have errors' do
          o = order
          o.status = :done
          expect(o).not_to be_valid
        end
      end

      context 'when to received' do
        it 'has to have errors' do
          o = order
          o.status = :received
          expect(o).not_to be_valid
        end
      end

      context 'when to rejected' do
        it 'has to have errors' do
          o = order
          o.status = :rejected
          expect(o).not_to be_valid
        end
      end
    end

    context 'when change status from in_process' do
      subject(:order) do
        o = Order.create(customer_id: create(:customer).id)
        o.submitted!
        o.in_process!
        o.save
        o
      end

      context 'when to done' do
        it { expect(order.done!).to be(true) }
      end

      context 'when to submitted' do
        it 'has to have errors' do
          o = order
          o.status = :submitted
          expect(o).not_to be_valid
        end
      end

      context 'when to open' do
        it 'has to have errors' do
          o = order
          o.status = :open
          expect(o).not_to be_valid
        end
      end

      context 'when to received' do
        it 'has to have errors' do
          o = order
          o.status = :received
          expect(o).not_to be_valid
        end
      end

      context 'when to rejected' do
        it 'has to have errors' do
          o = order
          o.status = :rejected
          expect(o).not_to be_valid
        end
      end
    end

    context 'when change status from done' do
      subject(:order) do
        o = Order.create(customer_id: create(:customer).id)
        o.submitted!
        o.in_process!
        o.done!
        o
      end

      context 'when to open' do
        it 'has to have errors' do
          o = order
          o.status = :open
          expect(o).not_to be_valid
        end
      end

      context 'when to submitted' do
        it 'has to have errors' do
          o = order
          o.status = :submitted
          expect(o).not_to be_valid
        end
      end

      context 'when to in_process' do
        it 'has to have errors' do
          o = order
          o.status = :in_process
          expect(o).not_to be_valid
        end
      end

      context 'when to received' do
        it { expect(order.received!).to be(true) }
      end

      context 'when to rejected' do
        it 'has to have errors' do
          o = order
          o.status = :rejected
          expect(o).not_to be_valid
        end
      end
    end

    context 'when change status from received' do
      subject(:order) do
        o = Order.create(customer_id: create(:customer).id)
        o.submitted!
        o.in_process!
        o.done!
        o.received!
        o
      end

      context 'when to open' do
        it 'has to have errors' do
          o = order
          o.status = :open
          expect(o).not_to be_valid
        end
      end

      context 'when to submitted' do
        it 'has to have errors' do
          o = order
          o.status = :submitted
          expect(o).not_to be_valid
        end
      end

      context 'when to in_process' do
        it 'has to have errors' do
          o = order
          o.status = :in_process
          expect(o).not_to be_valid
        end
      end

      context 'when to done' do
        it 'has to have errors' do
          o = order
          o.status = :done
          expect(o).not_to be_valid
        end
      end

      context 'when to rejected' do
        it 'has to have errors' do
          o = order
          o.status = :rejected
          expect(o).not_to be_valid
        end
      end
    end

    context 'when change status from rejected' do
      subject(:order) do
        o = Order.create(customer_id: create(:customer).id)
        o.status = :rejected
        o.save
        o
      end

      context 'when to open' do
        it 'has to have errors' do
          o = order
          o.status = :open
          expect(o).not_to be_valid
        end
      end

      context 'when to submitted' do
        it 'has to have errors' do
          o = order
          o.status = :submitted
          expect(o).not_to be_valid
        end
      end

      context 'when to in_process' do
        it 'has to have errors' do
          o = order
          o.status = :in_process
          expect(o).not_to be_valid
        end
      end

      context 'when to done' do
        it 'has to have errors' do
          o = order
          o.status = :done
          expect(o).not_to be_valid
        end
      end

      context 'when to received' do
        it 'has to have errors' do
          o = order
          o.status = :received
          expect(o).not_to be_valid
        end
      end
    end
  end
end
