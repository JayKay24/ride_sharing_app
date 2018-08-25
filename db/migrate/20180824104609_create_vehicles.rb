class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.integer :no_of_seats
      t.string :vehicle_type
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
