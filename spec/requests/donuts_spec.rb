require 'rails_helper'

RSpec.describe "Donuts", type: :request do
  describe "GET /donuts" do

    it "redirects when no user token given" do
      get donuts_path
      expect(response).to have_http_status(302)
    end
  end
end
