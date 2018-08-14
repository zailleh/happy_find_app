require 'rails_helper'

RSpec.describe Order, as: :module do
  let(:order) {
    no_validate = { validate: false }
    Order.create({
      :customer => Customer.new().save(no_validate),
      :supplier => Supplier.new().save(no_validate),
      :service  => Service.new().save(no_validate),
      :datetime => DateTime::now,
      :duration => 1.hour
    })
  }

  context 'when data is not valid' do
    let(:order) { Order.new()  }
    let(:valid) { Order.valid? }

    it "doesn't save" do
      expect(valid).to be false
    end

    describe "has presence validation errors on" do
      let(:errors) { order.errors }
      
      it 'customer' do
        expect(errors.details[:customer][:error]).to match /can't be blank/
      end
      
      it 'supplier' do
        expect(errors.details[:customer][:error]).to match /can't be blank/
      end
      
      it 'service' do
        expect(errors.details[:customer][:error]).to match /can't be blank/
      end
      
      it 'datetime' do
        expect(errors.details[:customer][:error]).to match /can't be blank/
      end
      
      it 'duration' do
        expect(errors.details[:customer][:error]).to match /can't be blank/
      end
    end
  end

  it 'has a Customer' do
    pending 'Not yet implemented'
    expect(order.customer).to_not be nil
    expect(order.customer.class).to eq Customer
  end

  it 'has a Supplier' do
    pending 'Not yet implemented'

    expect(order.supplier).to_not be nil
    expect(order.supplier.class).to eq Supplier
  end

  it 'has a Service' do
    pending 'Not yet implemented'

    expect(order.supplier).to_not be nil
    expect(order.supplier.class).to eq Supplier
  end
end