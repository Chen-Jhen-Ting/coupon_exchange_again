require 'rails_helper'
require 'taiwanese_id_validator/twid_generator'

RSpec.describe Coupon, type: :model do
  let(:user) do
    User.create(
      email: Faker::Internet.email,
      password: Faker::String.random
    )
  end

  describe 'Coupon validation' do
    context 'with name, phone and twid' do
      it 'should be ok' do
        coupon = user.build_coupon(
          name: Faker::Name.name  ,
          phone: Faker::PhoneNumber.cell_phone,
          twid: TwidGenerator.generate
        )
        expect(coupon).to be_valid
      end
    end

    context 'without name' do
      it 'should not be ok' do
        coupon = user.build_coupon(
          name: "",
          phone: Faker::PhoneNumber.cell_phone,
          twid: TwidGenerator.generate
        )
        expect(coupon).not_to be_valid
      end
    end

    context 'without phone' do
      it 'should not be ok' do
        coupon = user.build_coupon(
          name: Faker::Name.name ,
          phone: "",
          twid: TwidGenerator.generate
        )
        expect(coupon).not_to be_valid
      end
    end

    context 'without twid' do
      it 'should not be ok' do
        coupon = user.build_coupon(
          name: Faker::Name.name ,
          phone: Faker::PhoneNumber.cell_phone,
          twid: ""
        )
        expect(coupon).not_to be_valid
      end
    end

    context 'with incorrect twid' do
      it 'should not be ok' do
        coupon = user.build_coupon(
          name: Faker::Name.name ,
          phone: Faker::PhoneNumber.cell_phone,
          twid: "fffffff"
        )
        expect(coupon).not_to be_valid
      end
    end
  end

  describe '.create' do 
    context 'with name, phone, twid(faker)' do
      it 'should be ok' do
        coupon = user.create_coupon(
          name: Faker::Name.name  ,
          phone: Faker::PhoneNumber.cell_phone,
          twid: TwidGenerator.generate
        )
        expect(coupon).to eq(Coupon.last)
      end
    end

    context 'with name, phone, twid' do
      it 'should be ok' do
        coupon = user.create_coupon(
          name: 'Apple'  ,
          phone: '0911059123',
          twid: TwidGenerator.generate
        )
        expect(coupon.name).to eq('Apple')
        expect(coupon.phone).to eq('0911059123')
      end
    end
  end

  describe 'Coupon uuid generator' do
    context 'when user creates a coupon' do
      it 'should be exist' do
        coupon = user.create_coupon(
          name: Faker::Name.name,
          phone: Faker::PhoneNumber.cell_phone,
          twid: TwidGenerator.generate
        )
        expect(coupon.uuid).not_to eq("")
        expect(coupon.uuid).to be_present
      end
    end
  end
end
