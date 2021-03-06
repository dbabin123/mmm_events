require "rails_helper"

RSpec.describe "goings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/goings/#{going.id}", params: params
  end

  describe "basic fetch" do
    let!(:going) { create(:going) }

    it "works" do
      expect(GoingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("goings")
      expect(d.id).to eq(going.id)
    end
  end
end
