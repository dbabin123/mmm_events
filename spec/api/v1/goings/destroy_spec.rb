require "rails_helper"

RSpec.describe "goings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/goings/#{going.id}"
  end

  describe "basic destroy" do
    let!(:going) { create(:going) }

    it "updates the resource" do
      expect(GoingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Going.count }.by(-1)
      expect { going.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
