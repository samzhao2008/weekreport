require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :title => "MyString",
      :content => "MyText",
      :author => 1
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input#message_title[name=?]", "message[title]"

      assert_select "textarea#message_content[name=?]", "message[content]"

      assert_select "input#message_author[name=?]", "message[author]"
    end
  end
end
