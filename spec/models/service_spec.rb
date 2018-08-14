require 'rails_helper'

RSpec.describe Service, as: :model do
  context 'when service is not valid' do
    let(:service) { Service.new }
    let(:valid) { service.valid? }
    
    it 'fails validation' do
      expect(valid).to be false
    end

    describe 'has validation errors on' do
      let(:errors) { service.errors }

      it 'supplier' do
        expect(errors.details[:supplier][:error]).to match /can't be blank/
      end

      it 'skill' do
        expect(errors.details[:skill][:error]).to match /can't be blank/
      end

      it 'cost' do
        expect(errors.details[:cost][:error]).to match /can't be blank/
      end
    end
  end

  context 'when service is valid' do
    let(:service) { 
      no_validate = { validate: false }
      Service.create(
        :supplier => Supplier.new().save(no_validate),
        :skill => Skill.new().save(no_validate),
        :cost => 100
    )}

    it 'saves' do
      expect(service.save).to be true
    end
  end
end