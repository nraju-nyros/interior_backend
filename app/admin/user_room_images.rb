ActiveAdmin.register UserRoomImage do
  permit_params do
    permitted = [:user_requirement_id, :name, :room_image_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  index do |user_room_image|
    selectable_column
    column :id
    column "Image" do |product|
      if product.room_image.present?
        image_tag product.room_image.name_url, class: 'my_image_size'
      else
         image_tag 'default.jpg'
      end
    end
    column :user_requirement_id
    column :Actions do |user_room_image|
      links = link_to "View", admin_user_room_image_path(user_room_image), :class => 'view' 
      links += link_to "Edit", edit_admin_user_room_image_path(user_room_image), :class => 'view' 
      links += link_to "Delete", admin_user_room_image_path(user_room_image), :method => :delete, data: { confirm: "Are you sure?" }, :class => 'view' 
      links
    end
  end

  show do |user_room_image|
    attributes_table do
      row :id
      row "name" do  |user_room_image|
        if user_room_image.room_image.present?
          user_room_image.room_image.name
        else
          " "
        end
      end
    
      row "Image" do  |user_room_image|
        if user_room_image.room_image.present?
          image_tag user_room_image.room_image.name_url, class: 'user_image'
        else
          image_tag 'default.jpg'
        end
      end

      row :user_requirement_id 
    end

    div class: 'back' do 
      link_to "Back", admin_user_room_images_path
    end

  end   
end
