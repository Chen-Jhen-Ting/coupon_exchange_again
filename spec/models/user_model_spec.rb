require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validation' do
    context 'with email and password' do
      it 'should be ok' do
        user = User.new(
          email: Faker::Internet.email,
          password: Faker::String.random
        )
        expect(user).to be_valid
      end
    end

    context 'without email' do
      it 'should not be ok' do
        user = User.new(
          email: "",
          password: Faker::String.random
        )
        expect(user).not_to be_valid
      end
    end

    context 'without password' do
      it 'should not be ok' do
        user = User.new(
          email: Faker::Internet.email,
          password: ""
        )
        expect(user).not_to be_valid
      end
    end

    context 'without email and password' do
      it 'should not be ok' do
        user = User.new(
          email: "",
          password: ""
        )
        expect(user).not_to be_valid
      end
    end

    context 'incorrect email' do
      it 'should not be ok' do
        user = User.new(
          email: "abcde",
          password: Faker::String.random
        )
        expect(user).not_to be_valid
      end
    end

    context 'password too short' do
      it 'should not be ok' do
        user = User.new(
          email: Faker::Internet.email,
          password: '123'
        )
        expect(user).not_to be_valid
      end
    end
  end

  describe 'User create' do
    context 'with email and password' do
      it 'should create user' do
        user = User.create(
          email: Faker::Internet.email,
          password: Faker::String.random
        )
        expect(user).to eq(User.last)
      end
    end
  end

  describe 'User table' do
    context 'well control user table' do
      it 'should contain id email encrypted_password' do
        columns = User.column_names
        expect(columns).to include("id")
        expect(columns).to include("email")
        expect(columns).to include("encrypted_password")
      end
    end
  end
end
