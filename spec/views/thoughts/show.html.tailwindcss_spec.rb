require 'rails_helper'

RSpec.describe "thoughts/show", type: :view do
  before(:each) do
    assign(:thought, Thought.create!(
      title: "Title",
      body: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
