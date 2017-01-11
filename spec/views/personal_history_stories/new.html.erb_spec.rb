require 'rails_helper'

RSpec.describe "personal_history_stories/new", type: :view do
  before(:each) do
    assign(:personal_history_story, PersonalHistoryStory.new(
      :subject => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new personal_history_story form" do
    render

    assert_select "form[action=?][method=?]", personal_history_stories_path, "post" do

      assert_select "input#personal_history_story_subject[name=?]", "personal_history_story[subject]"

      assert_select "textarea#personal_history_story_body[name=?]", "personal_history_story[body]"
    end
  end
end
