class Api::V1::UserRoomTypesController < ApplicationController
  def index
    @rooms = UserRoomType.all
   
     render json: @rooms , status: :ok
    # binding.pry
  end
 
  def show
     @user_roomtype = UserRoomType.find(params[:id])
     render json: @user_roomtype , status: :ok
  end
 
  def new   
     @user_roomtype = UserRoomType.new(user_room_type_params)
     rende json: @user_roomtype 
  end   
   
  def create   
    @user_roomtype = UserRoomType.new(user_room_type_params)   
    if @user_roomtype.save  
     render json: @user_roomtype , status: :created, location: api_v1_users_url(@user_roomtype) 
    else   
       render json: @user_roomtype.errors, status: :unprocessable_entity
    end   
  end  


  def edit 
    @user_roomtype = UserRoomType.find(params[:id]) 
      render json: @user_roomtype

  end 
   
  def update   
    @user_roomtype = UserRoomType.find(params[:id])   
    if @user_roomtype.update_attributes(user_room_type_params)   
    else     
    render json: @user_roomtype.errors, status: :unprocessable_entity
    end   
  end   

  
 
  def destroy
    @user_roomtype = UserRoomType.find(params[:id])  
    @user_roomtype.delete     
  end   

  private
  def set_room
   @user_roomtype = UserRoomType.find(params[:id])
  end
   
  private
  def user_room_type_params   
    params.require(:user_roomtype).permit(:name, :content, :room_type_id)   
  end   
  

   
end  
