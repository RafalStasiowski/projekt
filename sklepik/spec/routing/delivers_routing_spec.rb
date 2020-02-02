require "rails_helper"

RSpec.describe DeliversController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/delivers").to route_to("delivers#index")
    end

    it "routes to #new" do
      expect(:get => "/delivers/new").to route_to("delivers#new")
    end

    it "routes to #show" do
      expect(:get => "/delivers/1").to route_to("delivers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/delivers/1/edit").to route_to("delivers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/delivers").to route_to("delivers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/delivers/1").to route_to("delivers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/delivers/1").to route_to("delivers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/delivers/1").to route_to("delivers#destroy", :id => "1")
    end
  end
end
