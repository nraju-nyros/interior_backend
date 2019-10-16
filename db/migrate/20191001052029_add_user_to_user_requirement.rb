class AddUserToUserRequirement < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_requirements, :user, foreign_key: true
  end
end
