require 'rails_helper'

RSpec.describe GoingResource, type: :resource do
  describe 'serialization' do
    let!(:going) { create(:going) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(going.id)
      expect(data.jsonapi_type).to eq('goings')
    end
  end

  describe 'filtering' do
    let!(:going1) { create(:going) }
    let!(:going2) { create(:going) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: going2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([going2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:going1) { create(:going) }
      let!(:going2) { create(:going) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            going1.id,
            going2.id
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
            going2.id,
            going1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
