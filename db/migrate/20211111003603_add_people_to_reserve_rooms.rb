class AddPeopleToReserveRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :reserve_rooms, :people, :integer, null: false
  end
end
