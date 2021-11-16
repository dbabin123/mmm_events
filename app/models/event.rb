class Event < ApplicationRecord
  # Direct associations

  has_many   :attendees,
             class_name: "Going",
             dependent: :destroy

  belongs_to :host,
             class_name: "Profile",
             foreign_key: "profile_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    host.to_s
  end
end
