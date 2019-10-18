ActiveAdmin.register RoomType do
  permit_params do
    permitted = [:name, :image]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  index do
    selectable_column
    column :id
    column :name
    column "Image" do |product|
      image_tag product.image_url, class: 'my_image_size'
    end
    column :Actions do |room_type|
      links = link_to "View", admin_room_type_path(room_type), :class => 'view' 
      links += link_to "Edit", edit_admin_room_type_path(room_type), :class => 'view' 
      links += link_to "Delete", admin_room_type_path(room_type), :method => :delete, data: { confirm: "Are you sure?" }, :class => 'view' 
      links
    end
  end

  show do
    attributes_table do
      row :id
      row :name
      row "Image" do |product|
        image_tag product.image_url, class: 'user_image'
      end
    end

    div class: 'back btn btn-success' do 
      link_to "Back", admin_room_types_path
    end
  end

  
end
