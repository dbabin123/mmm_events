class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :event_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
