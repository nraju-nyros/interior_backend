class AddroomnameToroomimages < ActiveRecord::Migration[5.2]
  def change
  	 add_column :user_room_types, :user_requirement_id, :integer
    add_column :user_room_types, :name, :string
  end
end
