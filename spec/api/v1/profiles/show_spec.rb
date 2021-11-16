require 'rails_helper'

RSpec.describe "profiles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/profiles/#{profile.id}", params: params
  end

  describe 'basic fetch' do
    let!(:profile) { create(:profile) }

    it 'works' do
      expect(ProfileResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('profiles')
      expect(d.id).to eq(profile.id)
    end
  end
end
