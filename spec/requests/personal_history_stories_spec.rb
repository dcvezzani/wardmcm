require 'rails_helper'

RSpec.describe "PersonalHistoryStories", type: :request do
  describe "GET /personal_history_stories" do
    it "works! (now write some real specs)" do
      get personal_history_stories_path
      expect(response).to have_http_status(200)
    end
  end
end
