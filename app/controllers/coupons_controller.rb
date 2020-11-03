class CouponsController < ApplicationController
  
  before_action :authenticate_user!

  def new
    @coupon = Coupon.new
  end

  def create

  end

end
