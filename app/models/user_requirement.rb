class UserRequirement < ApplicationRecord
	has_many :user_room_images
	has_many :user_room_types
  accepts_nested_attributes_for :user_room_images, allow_destroy: true
  accepts_nested_attributes_for :user_room_types, allow_destroy: true


     belongs_to :user, inverse_of: :user_requirements
end


