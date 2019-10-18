ActiveAdmin.register UserRoomType do
  permit_params do
    permitted = [:user_requirement_id, :name, :content, :room_type_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  index do
    selectable_column
    column :id
    column "name" do |product|
      if product.room_type.present?
        product.room_type.name
      else
        ""
      end
    end
    column "Image" do |product|
      if product.room_type.present?
        image_tag product.room_type.image_url, class: 'my_image_size'
      else
        image_tag "default.jpg"
      end
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
      row "name" do  |user_room_image|
        if user_room_image.room_type.present?
          user_room_image.room_type.name
        else
          ""
        end
      end

      row "Image" do  |user_room_image|
        if user_room_image.room_type.present?
          image_tag user_room_image.room_type.image_url, class: 'user_image'
        else
          image_tag "default.jpg"
        end
      end
      row :user_requirement_id 
    end

    div class: 'back' do 
      link_to "Back", admin_user_room_types_path
    end
   
  end
end
