# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string
#  email           :string
#  name            :string
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  type            :string
#

require 'rails_helper'

RSpec.describe User, as: :model do
  describe 'User' do
    let(:user) { User.create }

    it 'has a secure password' do
      expect(user.password_digest).to be nil
      user.password = 'chicken'
      expect(user.password_digest).to_not be nil
      expect(user.authenticate 'chicken').to be user
    end

    it "doesn't allow invalid data" do
      expect(User.all.size).to eq 0
    end

    it "saves with valid data" do
      User.create(
        name: "Test",
        email: "test@test.com",
        password: "chicken",
        username: "test"
      )
      expect(User.all.size).to eq 1
    end

    it "doesnt allow duplicate username or email address" do
      User.create(
        name: "Test",
        email: "test@test.com",
        password: "chicken",
        username: "test"
      )

      User.create(
        name: "Test2",
        email: "test@test.com", #duplicate email
        password: "chicken",
        username: "test2"
      )

      User.create(
        name: "Test3",
        email: "test3@test.com",
        password: "chicken",
        username: "test" #duplicate username
      )

      expect(User.all.size).to eq 1
    end

    describe 'customer' do
      let(:user) { Customer.create :password => 'chicken' }

      it 'is a customer user' do
        expect(user.class).to be Customer
      end

      it 'has single table inheritance from user' do
        expect(user.is_a?(User)).to be true
      end

      it 'remembers its type' do
        expect(User.find user.id).to eq user
      end
    end

    describe 'supplier' do
      let(:user) { Supplier.create :password => 'chicken' }

      it 'is supplier user' do
        expect(user.class).to be Supplier
      end

      it 'has single table inheritance from user' do
        expect(user.is_a?(User)).to be true
      end

      it 'remembers its type' do
        expect(User.find user.id).to eq user
      end
    end
  end
end
