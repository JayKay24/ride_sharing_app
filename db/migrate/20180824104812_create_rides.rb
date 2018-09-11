class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :origin
      t.string :destination
      t.integer :remaining_seats
      t.time :take_off_time
      t.date :take_off_date
      t.belongs_to :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
