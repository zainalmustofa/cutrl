require "rails_helper"

RSpec.describe ContactformsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/contactforms").to route_to("contactforms#index")
    end

    it "routes to #new" do
      expect(:get => "/contactforms/new").to route_to("contactforms#new")
    end

    it "routes to #show" do
      expect(:get => "/contactforms/1").to route_to("contactforms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/contactforms/1/edit").to route_to("contactforms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/contactforms").to route_to("contactforms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/contactforms/1").to route_to("contactforms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/contactforms/1").to route_to("contactforms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/contactforms/1").to route_to("contactforms#destroy", :id => "1")
    end

  end
end
