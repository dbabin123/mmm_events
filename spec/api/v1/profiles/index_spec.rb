require "rails_helper"

RSpec.describe "profiles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/profiles", params: params
  end

  describe "basic fetch" do
    let!(:profile1) { create(:profile) }
    let!(:profile2) { create(:profile) }

    it "works" do
      expect(ProfileResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["profiles"])
      expect(d.map(&:id)).to match_array([profile1.id, profile2.id])
    end
  end
end
