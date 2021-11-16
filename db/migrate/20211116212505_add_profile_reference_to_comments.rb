class AddProfileReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :profiles
    add_index :comments, :profile_id
    change_column_null :comments, :profile_id, false
  end
end
