require 'rails_helper'

RSpec.describe "goings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/goings/#{going.id}", payload
  end

  describe 'basic update' do
    let!(:going) { create(:going) }

    let(:payload) do
      {
        data: {
          id: going.id.to_s,
          type: 'goings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GoingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { going.reload.attributes }
    end
  end
end
