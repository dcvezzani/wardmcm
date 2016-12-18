require 'rails_helper'

RSpec.describe "text_messages/new", type: :view do
  before(:each) do
    assign(:text_message, TextMessage.new(
      :subject => "MyString",
      :body => "MyString"
    ))
  end

  it "renders new text_message form" do
    render

    assert_select "form[action=?][method=?]", text_messages_path, "post" do

      assert_select "input#text_message_subject[name=?]", "text_message[subject]"

      assert_select "input#text_message_body[name=?]", "text_message[body]"
    end
  end
end
