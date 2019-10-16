class UserRoomType < ApplicationRecord
	belongs_to :user_requirement, inverse_of: :user_room_types

	belongs_to :room_type
end
