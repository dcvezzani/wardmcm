require "rails_helper"

RSpec.describe PersonalHistoryStoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/personal_history_stories").to route_to("personal_history_stories#index")
    end

    it "routes to #new" do
      expect(:get => "/personal_history_stories/new").to route_to("personal_history_stories#new")
    end

    it "routes to #show" do
      expect(:get => "/personal_history_stories/1").to route_to("personal_history_stories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/personal_history_stories/1/edit").to route_to("personal_history_stories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/personal_history_stories").to route_to("personal_history_stories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/personal_history_stories/1").to route_to("personal_history_stories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/personal_history_stories/1").to route_to("personal_history_stories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/personal_history_stories/1").to route_to("personal_history_stories#destroy", :id => "1")
    end

  end
end
