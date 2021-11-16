require "rails_helper"

RSpec.describe Profile, type: :model do
  describe "Direct Associations" do
    it { should have_many(:comments) }

    it { should have_many(:rsvps) }

    it { should have_many(:events) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
