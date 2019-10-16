class RenameroomstoroomImages < ActiveRecord::Migration[5.2]
  def change
  	rename_table :rooms, :room_images
  end
end
