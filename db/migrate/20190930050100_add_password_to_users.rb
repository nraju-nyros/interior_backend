class AddPasswordToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_type_id
    add_column :users, :username, :string
    add_column :users, :password_digest, :string
  end
end
