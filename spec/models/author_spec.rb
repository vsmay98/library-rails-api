require 'rails_helper'

describe Author do
  subject { create(:author) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid attributes" do
    expect(Author.new(last_name: 'abcd')).to_not be_valid
  end
end