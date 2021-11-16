class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :profile_id
      t.datetime :date_time
      t.string :location
      t.string :details
      t.string :comments

      t.timestamps
    end
  end
end
