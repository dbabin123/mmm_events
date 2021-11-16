class Going < ApplicationRecord
  # Direct associations

  belongs_to :event

  belongs_to :attendee,
             :class_name => "Profile",
             :foreign_key => "profile_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    attendee.to_s
  end

end
