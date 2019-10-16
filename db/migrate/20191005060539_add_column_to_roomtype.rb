class AddColumnToRoomtype < ActiveRecord::Migration[5.2]
  def change

    add_column :user_room_types, :content, :string

  end
end
