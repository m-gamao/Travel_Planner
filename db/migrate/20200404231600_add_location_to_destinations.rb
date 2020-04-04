class AddLocationToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :location, :string
  end
end
