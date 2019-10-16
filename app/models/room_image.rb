class RoomImage < ApplicationRecord
  mount_uploader :name, ImageUploader

  has_many :user_room_images
end


