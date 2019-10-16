class AddroomnameToroomtypes < ActiveRecord::Migration[5.2]
  def change
    add_column :user_room_images, :user_requirement_id, :integer
    add_column :user_room_images, :name, :string
  end
end
