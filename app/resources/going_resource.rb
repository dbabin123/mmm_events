class GoingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :profile_id, :integer
  attribute :event_id, :integer

  # Direct associations

  # Indirect associations

end
