class EventResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :profile_id, :integer
  attribute :date_time, :datetime
  attribute :location, :string
  attribute :details, :string
  attribute :comments, :string

  # Direct associations

  # Indirect associations

end
