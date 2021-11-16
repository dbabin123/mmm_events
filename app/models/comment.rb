class Comment < ApplicationRecord
  # Direct associations

  belongs_to :profile

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event_id
  end

end
