require 'rails_helper'

RSpec.describe "LessActiveMembers", type: :request do
  describe "GET /less_active_members" do
    it "works! (now write some real specs)" do
      get less_active_members_path
      expect(response).to have_http_status(200)
    end
  end
end
