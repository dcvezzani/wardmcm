require 'rails_helper'

RSpec.describe "text_messages/show", type: :view do
  before(:each) do
    @text_message = assign(:text_message, TextMessage.create!(
      :subject => "Subject",
      :body => "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/Body/)
  end
end
