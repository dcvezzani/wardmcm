require 'rails_helper'

RSpec.describe "personal_history_stories/index", type: :view do
  before(:each) do
    assign(:personal_history_stories, [
      PersonalHistoryStory.create!(
        :subject => "Subject",
        :body => "MyText"
      ),
      PersonalHistoryStory.create!(
        :subject => "Subject",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of personal_history_stories" do
    render
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
