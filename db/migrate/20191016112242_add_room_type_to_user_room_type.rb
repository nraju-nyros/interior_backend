class AddRoomTypeToUserRoomType < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_room_types, :room_type, foreign_key: true
  end
end
