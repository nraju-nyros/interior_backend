class UserRoomImage < ApplicationRecord
	belongs_to :user_requirement, inverse_of: :user_room_images

	belongs_to :room_image
end
