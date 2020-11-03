class Coupon < ApplicationRecord
  belongs_to :user

  before_create :create_uuid
 
  private
  def create_uuid
    self.uuid = serial_generator(10)
  end

  def serial_generator(n)
    [*'a'..'z', *'A'..'Z', *0..9].sample(n).join
  end

end
