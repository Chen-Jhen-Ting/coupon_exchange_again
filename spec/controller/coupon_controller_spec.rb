require 'rails_helper'
require 'taiwanese_id_validator/twid_generator'

RSpec.describe CouponsController, type: :controller do
  let(:user) do
    User.create(
      email: Faker::Internet.email,
      password: Faker::String.random
    )
  end

  before do
    sign_in user
  end
end
