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

    # Assign featured thoughts as an empty array to prevent nil error
    assign(:featured_thoughts, [])

    # Stub authentication methods
    allow(view).to receive(:user_signed_in?).and_return(false)
  end

  it "renders a list of thoughts" do
    render
    # Check for titles in h2 elements within article.post-body
    assert_select "article.post-body h2.post-title", text: Regexp.new("Title".to_s), count: 2
    # Check for body text in p elements within article.post-body
    assert_select "article.post-body p", text: Regexp.new("MyText".to_s), count: 2
  end
end
