require 'rails_helper'

RSpec.describe Service, as: :model do
  context 'when service is not valid' do
    let(:service) { Service.new }
    
    it 'fails validation' do
      expect(service.save).to be false
    end

    describe 'has validation errors on' do
      let(:messages) { service.valid?; service.errors.messages }

      it 'supplier' do
        expect(messages[:supplier].join(' ')).to match /must exist/
      end

      it 'skill' do
        expect(messages[:skill].join(' ')).to match /must exist/
      end

      it 'cost' do
        expect(messages[:cost].join(' ')).to match /can't be blank/
      end
    end
  end

  context 'when service is valid' do
    let(:service) { 
      no_validate = { validate: false }
      Service.create(
        :supplier => Supplier.new(),
        :skill => Skill.new(),
        :cost => 100
    )}

    it 'saves' do
      expect(service.save).to be true
    end
  end
end