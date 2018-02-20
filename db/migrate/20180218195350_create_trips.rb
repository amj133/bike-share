class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.references :start_date
      t.references :start_station
      t.datetime :end_date
      t.references :end_station
      t.integer :bike_id
      t.string :subscription
      t.integer :zipcode
    end
  end
end
