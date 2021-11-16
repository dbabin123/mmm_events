require 'rails_helper'

RSpec.describe GoingResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'goings',
          attributes: { }
        }
      }
    end

    let(:instance) do
      GoingResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Going.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:going) { create(:going) }

    let(:payload) do
      {
        data: {
          id: going.id.to_s,
          type: 'goings',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      GoingResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { going.reload.updated_at }
      # .and change { going.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:going) { create(:going) }

    let(:instance) do
      GoingResource.find(id: going.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Going.count }.by(-1)
    end
  end
end
