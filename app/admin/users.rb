ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :username, :password_digest, :token, :reset_password_token, :reset_password_sent_at
  #
  # or
  #
  permit_params do
    permitted = [:name, :email, :username, :password_digest, :token, :reset_password_token, :reset_password_sent_at]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end


   index do
    selectable_column
    column :id
    column :name 
    column :email
    column :password_digest 
    column :Actions do |user|
      links = link_to "View", admin_user_path(user), :class => 'view' 
      links += link_to "Edit", edit_admin_user_path(user), :class => 'view' 
      links += link_to "Delete", admin_user_path(user), :method => :delete, data: { confirm: "Are you sure?" }, :class => 'view' 
      links
    end
  end


   show do |user|
    attributes_table do
      row :id
      row :name 
      row :email 
      row :password_digest
      row :token
      row :reset_password_token
      row :reset_password_sent_at


      div class: 'back' do 
        link_to "Back", admin_users_path
      end
    
    end
  
end

end
