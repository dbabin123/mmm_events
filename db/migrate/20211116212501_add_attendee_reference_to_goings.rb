class AddAttendeeReferenceToGoings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :goings, :profiles
    add_index :goings, :profile_id
    change_column_null :goings, :profile_id, false
  end
end
