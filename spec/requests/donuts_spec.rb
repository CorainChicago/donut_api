require 'rails_helper'

RSpec.describe "Donuts", type: :request do
  describe "GET /donuts" do
    it "works! (now write some real specs)" do
      get donuts_path
      expect(response).to have_http_status(200)
    end
  end
end
