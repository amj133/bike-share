class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.references :station, foreign_key: true
      t.integer :bikes_available
      t.integer :docks_available
      t.datetime :time
    end
  end
end
