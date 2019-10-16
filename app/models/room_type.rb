class RoomType < ApplicationRecord
 mount_uploader :image, ImageUploader

 has_many :user_room_images
end