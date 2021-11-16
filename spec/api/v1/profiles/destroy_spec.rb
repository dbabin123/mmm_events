require 'rails_helper'

RSpec.describe "profiles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/profiles/#{profile.id}"
  end

  describe 'basic destroy' do
    let!(:profile) { create(:profile) }

    it 'updates the resource' do
      expect(ProfileResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Profile.count }.by(-1)
      expect { profile.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
