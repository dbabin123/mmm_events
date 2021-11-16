require 'rails_helper'

RSpec.describe "goings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/goings", params: params
  end

  describe 'basic fetch' do
    let!(:going1) { create(:going) }
    let!(:going2) { create(:going) }

    it 'works' do
      expect(GoingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['goings'])
      expect(d.map(&:id)).to match_array([going1.id, going2.id])
    end
  end
end
