class Removeforeignkey < ActiveRecord::Migration[5.2]
 def change
    remove_foreign_key :users, :user_types
  end
end
