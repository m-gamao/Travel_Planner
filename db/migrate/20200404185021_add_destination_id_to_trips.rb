class AddDestinationIdToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :destination_id, :integer
  end
end
