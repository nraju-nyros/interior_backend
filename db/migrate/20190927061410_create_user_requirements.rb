class CreateUserRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :user_requirements do |t|
    	t.string :name
    	t.string :email
    	t.integer :user_type_id
    	t.integer :user_room_image_id
    	t.integer :user_room_type_id

      t.timestamps
    end
  end
end
