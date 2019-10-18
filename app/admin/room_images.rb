ActiveAdmin.register RoomImage do

  permit_params do
    permitted = [:name]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  index do
    selectable_column
    column :id
    column "Image" do |product|
      image_tag product.name_url, class: 'my_image_size'
    end
    column :Actions do |room_image|
      links = link_to "View", admin_room_image_path(room_image), :class => 'view' 
      links += link_to "Edit", edit_admin_room_image_path(room_image), :class => 'view' 
      links += link_to "Delete", admin_room_image_path(room_image), :method => :delete, data: { confirm: "Are you sure?" }, :class => 'view' 
      links
    end
  end

  show do |room_image|
    attributes_table do
      row :id
      row "Image" do |product|
        image_tag product.name_url, class: 'user_image'
      end
    end
    
    div class: 'back' do 
      link_to "Back", admin_room_images_path
    end
  end
end
