class AddAboutMyselfToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :about_myself, :text
  end
end
