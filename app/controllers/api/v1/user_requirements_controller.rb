class Api::V1::UserRequirementsController < ApplicationController
  def index
    @user_requirements = UserRequirement.all
    render json: @user_requirements, status: :ok
  end

  def show
     @user_requirement = UserRequirement.find(params[:id])
     render json: @user_requirement
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
    params.require(:user_requirement).permit(:name, :email, :user_type, user_room_images_attributes: [:room_image_id, :name], user_room_types_attributes: [:room_type_id, :name, :content]);  
  end  
end
