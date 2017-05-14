require "rails_helper"

RSpec.describe DonutsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/donuts").to route_to("donuts#index")
    end

    it "routes to #new" do
      expect(:get => "/donuts/new").to route_to("donuts#new")
    end

    it "routes to #show" do
      expect(:get => "/donuts/1").to route_to("donuts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/donuts/1/edit").to route_to("donuts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/donuts").to route_to("donuts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/donuts/1").to route_to("donuts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/donuts/1").to route_to("donuts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/donuts/1").to route_to("donuts#destroy", :id => "1")
    end

  end
end
