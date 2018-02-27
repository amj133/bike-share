class ChangeZipCodeTypeInTrips < ActiveRecord::Migration[5.1]
  def change
    change_column :trips, :zipcode, :bigint
  end
end
