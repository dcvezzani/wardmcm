require "rails_helper"

RSpec.describe LessActiveMembersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/less_active_members").to route_to("less_active_members#index")
    end

    it "routes to #new" do
      expect(:get => "/less_active_members/new").to route_to("less_active_members#new")
    end

    it "routes to #show" do
      expect(:get => "/less_active_members/1").to route_to("less_active_members#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/less_active_members/1/edit").to route_to("less_active_members#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/less_active_members").to route_to("less_active_members#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/less_active_members/1").to route_to("less_active_members#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/less_active_members/1").to route_to("less_active_members#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/less_active_members/1").to route_to("less_active_members#destroy", :id => "1")
    end

  end
end
