class AddLanguageToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :language, :string
  end
end
