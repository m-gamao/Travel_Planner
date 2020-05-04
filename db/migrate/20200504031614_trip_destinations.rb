class TripDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_destinations do |t| 
      t.integer :trip_id
      t.integer :destination_id
    end
  end
end
