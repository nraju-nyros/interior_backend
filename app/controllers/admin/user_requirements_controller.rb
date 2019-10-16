class Admin::UserRequirementsController < ApplicationController
  def index
    @user_requirements = UserRequirement.all
    @user_room_images = UserRoomImage.all
   
  end

  def show
     @user_requirement = UserRequirement.find(params[:id])
    
  end

  def new   
    @user_requirement = UserRequirement.new
  end   
   
  def create 
    @user_requirement = UserRequirement.new(user_requirement_params)
    if @user_requirement.save
      render json: @user_requirement, status: :created    
    else   
      render json: @user_requirement.errors, status: :unprocessable_entity
    end   
  end

  def destroy
  end
  
  private
  def user_requirement_params   
    params.require(:user_requirement).permit(:name, :email, :user_type, user_room_images_attributes: [:name], user_room_types_attributes: [:name]);  
  end  
end
