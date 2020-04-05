class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.integer :user_id
      t.integer :trip_id
      t.string :name
      t.string :description
      t.string :location
    end
  end
end
