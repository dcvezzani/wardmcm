require 'rails_helper'

RSpec.describe "text_messages/index", type: :view do
  before(:each) do
    assign(:text_messages, [
      TextMessage.create!(
        :subject => "Subject",
        :body => "Body"
      ),
      TextMessage.create!(
        :subject => "Subject",
        :body => "Body"
      )
    ])
  end

  it "renders a list of text_messages" do
    render
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
