class CreateUserRoomImages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_room_images do |t|
      t.integer :user_id
      t.integer :room_image_id

      t.timestamps
    end
  end
end
