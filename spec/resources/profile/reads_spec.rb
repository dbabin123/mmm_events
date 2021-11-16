require 'rails_helper'

RSpec.describe ProfileResource, type: :resource do
  describe 'serialization' do
    let!(:profile) { create(:profile) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(profile.id)
      expect(data.jsonapi_type).to eq('profiles')
    end
  end

  describe 'filtering' do
    let!(:profile1) { create(:profile) }
    let!(:profile2) { create(:profile) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: profile2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([profile2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:profile1) { create(:profile) }
      let!(:profile2) { create(:profile) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            profile1.id,
            profile2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            profile2.id,
            profile1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
