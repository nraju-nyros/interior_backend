ActiveAdmin.register UserRequirement do

  permit_params do
    permitted = [:name, :email, :user_type, :user_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end


  index do
    selectable_column
    column :id
    column :name do  |user_requirement|
      user_requirement.user.name
    end
    column :email do  |user_requirement|
      user_requirement.user.email
    end
    column :user_type 
   
    column :Actions do |user_requirement|
      links = link_to "View", admin_user_requirement_path(user_requirement), :class => 'view' 
      links += link_to "Edit", edit_admin_user_requirement_path(user_requirement), :class => 'view' 
      links += link_to "Delete", admin_user_requirement_path(user_requirement), :method => :delete, data: { confirm: "Are you sure?" }, :class => 'view' 
      links
    end
  end

  show do |user_requirement|
    attributes_table do
      row :id
      row :name do  |user_requirement|
        user_requirement.user.name
      end
      row :email do  |user_requirement|
        user_requirement.user.email
      end
      row :user_type
    end

    attributes_table_for user_requirement.user_room_images do
      h4 b "User Room Images"
      user_requirement.user_room_images.each do |img|
        span do
          if img.room_image.present?
            image_tag img.room_image.name_url, class: 'user_image'
          else
            image_tag "default.jpg"
          end
        end
      end     
    end
    
   
    attributes_table_for user_requirement.user_room_types do
      h4 b "User Room Types"
        div(:class => "rooms_list1") do 
          user_requirement.user_room_types.each do |img|

            div(:class => "rooms_types1") do
              if img.room_type.present?
                image_tag img.room_type.image_url, class: 'user_type'  
              else
                image_tag "default.jpg"
              end
            end

            span(:class => "room_name") do
              if img.room_type.present?
                img.room_type.name
              else
                ""
              end
            end 
          end  
        end
    end

    div class: 'back' do 
      link_to "Back", admin_user_requirements_path
    end

  end
end
