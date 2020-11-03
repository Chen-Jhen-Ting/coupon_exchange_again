require 'rails_helper'

RSpec.describe 'coupons', type: :routing do
  describe '#new' do
    it 'should be ok' do
      expect(:get => "/coupon").to route_to("coupons#new")      # ok
      expect(:post => "/coupon").not_to route_to("coupons#new") # not ok
    end
  end
  
  describe '#create' do
    it 'should be ok' do
      expect(:get => "/coupon").not_to route_to("coupons#create") # not ok
      expect(:post => "/coupon").to route_to("coupons#create")    # ok
    end
  end
end