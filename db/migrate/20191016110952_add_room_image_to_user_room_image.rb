class AddRoomImageToUserRoomImage < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_room_images, :room_image
  end
end
