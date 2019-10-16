ActiveAdmin.register UserRequirement do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :user_type, :user_id
  #
  # or
  #
  permit_params do
    permitted = [:name, :email, :user_type, :user_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end


   


  #    div do
  #      user_requirement.user_room_images do |u|
  #       u.name
  #      end
  #   end
  # end
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

       row :user_room_types do  |user_requirement|
       
        user_requirement.user_room_types.pluck(:content).join(', ')
      end


    
    end

    attributes_table_for user_requirement.user_room_images do
       h4 b "User Room Images"
      user_requirement.user_room_images.each do |img|
        span do
  
          img src: "/uploads/room_image/"+ img.name,:class => 'user_image'
        end
      end     
    end
    
   
    attributes_table_for user_requirement.user_room_types do
      h4 b "User Room Types"
        
        div(:class => "rooms_list1") do 
          user_requirement.user_room_types.each do |img|
        
            div(:class => "rooms_types1") do
         
               img src: "/uploads/room_type/"+ img.name,:class => 'user_type'
            end

            span(:class => "room_name") do
              img.content
            end 
          end  
        end
    end

      div class: 'back' do 
        link_to "Back", admin_user_requirements_path
      end

  end
  
end
