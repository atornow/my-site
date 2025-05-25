require 'rails_helper'

RSpec.describe "thoughts/index", type: :view do
  before(:each) do
    assign(:thoughts, [
      Thought.create!(
        title: "Title",
        body: "MyText"
      ),
      Thought.create!(
        title: "Title",
        body: "MyText"
      )
    ])
    
    # Stub authentication methods
    allow(view).to receive(:user_signed_in?).and_return(false)
  end

  it "renders a list of thoughts" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
