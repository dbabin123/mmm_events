class AddHostReferenceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :events, :profiles
    add_index :events, :profile_id
    change_column_null :events, :profile_id, false
  end
end
