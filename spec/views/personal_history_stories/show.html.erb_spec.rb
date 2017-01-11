require 'rails_helper'

RSpec.describe "personal_history_stories/show", type: :view do
  before(:each) do
    @personal_history_story = assign(:personal_history_story, PersonalHistoryStory.create!(
      :subject => "Subject",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
  end
end
