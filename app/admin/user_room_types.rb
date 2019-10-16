ActiveAdmin.register UserRoomType do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_requirement_id, :name, :content
  #
  # or
  #
  permit_params do
    permitted = [:user_requirement_id, :name, :content]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

   

  index do
    selectable_column
    column :id
    column "name", :content
    column "Image" do |product|
               img src: "/uploads/room_type/"+ product.name, class: 'my_image_size'
    end
    column :user_requirement_id

    column :Actions do |user_room_type|
      links = link_to "View", admin_user_room_type_path(user_room_type), :class => 'view' 
      links += link_to "Edit", edit_admin_user_room_type_path(user_room_type), :class => 'view' 
      links += link_to "Delete", admin_user_room_type_path(user_room_type), :method => :delete, data: { confirm: "Are you sure?" }, :class => 'view' 
      links
    end
    
  end

  show do
    attributes_table do
      row :id
      row "name", :name
      row "Image" do |product|
              img src: "/uploads/room_type/"+ product.name, class: 'user_image'
      end
       row :user_requirement_id 
    end

    div class: 'back' do 
      link_to "Back", admin_user_room_types_path
   end
   
  end
end
