class GoingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :profile_id, :integer
  attribute :event_id, :integer

  # Direct associations

  belongs_to :attendee,
             resource: ProfileResource,
             foreign_key: :profile_id

  # Indirect associations

end
