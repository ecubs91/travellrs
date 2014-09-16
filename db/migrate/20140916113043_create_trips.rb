class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :destination
      t.date :starting_date
      t.date :end_date
      t.string :interests
      t.integer :user_id

      t.timestamps
    end
  end
end
