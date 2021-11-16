class AddEventReferenceToGoings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :goings, :events
    add_index :goings, :event_id
    change_column_null :goings, :event_id, false
  end
end
