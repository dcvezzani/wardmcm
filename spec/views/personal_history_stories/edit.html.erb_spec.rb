require 'rails_helper'

RSpec.describe "personal_history_stories/edit", type: :view do
  before(:each) do
    @personal_history_story = assign(:personal_history_story, PersonalHistoryStory.create!(
      :subject => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit personal_history_story form" do
    render

    assert_select "form[action=?][method=?]", personal_history_story_path(@personal_history_story), "post" do

      assert_select "input#personal_history_story_subject[name=?]", "personal_history_story[subject]"

      assert_select "textarea#personal_history_story_body[name=?]", "personal_history_story[body]"
    end
  end
end
