require 'rails_helper'

describe Author do
  subject { create(:author) }

  # describe 'associations' do
  #   it { should have_many(:books) }
  # end

  # describe 'validations' do
  #   it { should validate_presence_of(:first_name) }
  #   it { should validate_presence_of(:last_name) }
  # end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid attributes" do
    expect(Author.new(last_name: 'abcd')).to_not be_valid
  end
end