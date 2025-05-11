# spec/models/thought_spec.rb
require 'rails_helper'

RSpec.describe Thought, type: :model do
  it "is valid with a title and body" do
    thought = Thought.new(title: "My first thought", body: "This is the content.")
    expect(thought).to be_valid
  end

  it "is invalid without a title" do
    thought = Thought.new(body: "No title here.")
    expect(thought).not_to be_valid
    expect(thought.errors[:title]).to include("can't be blank")
  end
end
