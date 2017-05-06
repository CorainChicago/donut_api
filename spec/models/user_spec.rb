# require 'rails_helper'

RSpec.describe User, type: :model do


  describe "sessions" do
    before do
      @user = FactoryGirl.create(:user)
      @api_key = FactoryGirl.create(:api_key)
    end

    it "is authenticated with a token" do
      put "/api/v1/users/#{@user.id}?user_email=#{@user.email}&auth_token=#{@user.authentication_token}", {user: {name: "New Name"}}, { "HTTP_AUTHORIZATION"=>"Token token=\"#{@api_key.access_token}\"" }
      response.status.should be(201)
    end
  end
end
