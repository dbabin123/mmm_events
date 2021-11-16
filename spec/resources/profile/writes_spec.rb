require "rails_helper"

RSpec.describe ProfileResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "profiles",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ProfileResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Profile.count }.by(1)
    end
  end

  describe "updating" do
    let!(:profile) { create(:profile) }

    let(:payload) do
      {
        data: {
          id: profile.id.to_s,
          type: "profiles",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ProfileResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { profile.reload.updated_at }
      # .and change { profile.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:profile) { create(:profile) }

    let(:instance) do
      ProfileResource.find(id: profile.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Profile.count }.by(-1)
    end
  end
end
