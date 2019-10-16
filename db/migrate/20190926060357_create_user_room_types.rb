class CreateUserRoomTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_room_types do |t|
      t.integer :user_id
      t.integer :room_type_id

      t.timestamps
    end
  end
end
