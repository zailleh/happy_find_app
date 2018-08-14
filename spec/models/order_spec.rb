require 'rails_helper'

RSpec.describe Order, as: :module do
  context 'when data is not valid' do
    let(:order) { Order.new  }
    let(:valid) { order.save }

    it "doesn't save" do
      expect(valid).to eq false
    end

    describe "has presence validation errors on" do
      let(:messages) { order.valid?; order.errors.messages }
      
      it 'customer' do
        expect(messages[:customer].join(' ')).to match /must exist/
      end
      
      it 'supplier' do
        expect(messages[:supplier].join(' ')).to match /must exist/
      end
      
      it 'service' do
        expect(messages[:service].join(' ')).to match /must exist/
      end
      
      it 'datetime' do
        expect(messages[:datetime].join(' ')).to match /can't be blank/
      end
      
      it 'duration' do
        expect(messages[:duration].join(' ')).to match /can't be blank/
      end
    end
  end

  context 'when data is valid' do
    let(:order) {
      no_validate = { validate: false }
      Order.create({
        :customer => Customer.new(),
        :supplier => Supplier.new(),
        :service  => Service.new(),
        :datetime => DateTime::now,
        :duration => 1.hour
      })
    }

    it 'will save' do
      expect(order.save).to be true
    end
    
    it 'has a Customer' do
      expect(order.customer).to_not be nil
      expect(order.customer.class).to eq Customer
    end

    it 'has a Supplier' do

      expect(order.supplier).to_not be nil
      expect(order.supplier.class).to eq Supplier
    end

    it 'has a Service' do

      expect(order.supplier).to_not be nil
      expect(order.supplier.class).to eq Supplier
    end
  end
end