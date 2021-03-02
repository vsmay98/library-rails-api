require 'rails_helper'

describe Author do
  subject { create(:author) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid attributes" do
    expect(Author.new(last_name: 'abcd')).to_not be_valid
  end

  it "#list_book_names" do
    expect(subject.list_book_names).to be_an_instance_of(Array)
  end

  it '#name_validate' do
    expect(subject.name_validate).to eq("#{subject.first_name} valid")
  end

  it '#name_validate false' do
    allow(subject).to receive(:valid?).and_return(false) #stub
    expect(subject.name_validate).to eq("Invalid First Name")
  end
end