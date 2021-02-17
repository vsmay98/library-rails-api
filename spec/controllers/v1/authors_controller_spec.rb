require 'rails_helper'

describe V1::AuthorsController do
  let(:author) {create(:author)}

  describe "#index" do
    subject {get :index}
    before {author}
    it {is_expected.to be_successful}

    it 'returns valid JSON' do
      body = JSON.parse(subject.body)
      expect(body['authors'].length).to eq(1)
      expect(body['extra_info']['total']).to be_present
    end
  end
end