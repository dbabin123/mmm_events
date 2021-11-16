class Event < ApplicationRecord
  # Direct associations

  belongs_to :host,
             :class_name => "Profile",
             :foreign_key => "profile_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    host.to_s
  end

end
