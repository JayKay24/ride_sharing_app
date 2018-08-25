class AddRegistrationNumberToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :reg_no, :string
  end
end
