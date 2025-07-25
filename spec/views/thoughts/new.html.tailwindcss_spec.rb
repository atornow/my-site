require 'rails_helper'

RSpec.describe "thoughts/new", type: :view do
  before(:each) do
    assign(:thought, Thought.new(
      title: "MyString",
      body: "MyText"
    ))
  end

  it "renders new thought form" do
    render

    assert_select "form[action=?][method=?]", thoughts_path, "post" do
      assert_select "input[name=?]", "thought[title]"

      assert_select "textarea[name=?]", "thought[body]"
    end
  end
end
