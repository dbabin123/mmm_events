require "rails_helper"

RSpec.describe "profiles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/profiles/#{profile.id}", payload
  end

  describe "basic update" do
    let!(:profile) { create(:profile) }

    let(:payload) do
      {
        data: {
          id: profile.id.to_s,
          type: "profiles",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ProfileResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { profile.reload.attributes }
    end
  end
end
