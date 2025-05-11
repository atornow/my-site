require 'rails_helper'

RSpec.describe "thoughts/edit", type: :view do
  let(:thought) {
    Thought.create!(
      title: "MyString",
      body: "MyText"
    )
  }

  before(:each) do
    assign(:thought, thought)
  end

  it "renders the edit thought form" do
    render

    assert_select "form[action=?][method=?]", thought_path(thought), "post" do

      assert_select "input[name=?]", "thought[title]"

      assert_select "textarea[name=?]", "thought[body]"
    end
  end
end
