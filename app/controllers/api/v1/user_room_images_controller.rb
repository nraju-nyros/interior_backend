class Api::V1::UserRoomImagesController < ApplicationController
  def index
    @rooms = UserRoomImage.all
    render json: @rooms , status: :ok 
  end
 
  def show
    @user_room_image = UserRoomImage.find(params[:id])
    render json: @user_room_image , status: :ok
  end
 
  def new   
    @user_room_image = UserRoomImage.new
    rende json: @user_room_image 
  end   
   
  # def create   
  #   binding.pry
  #   @user_room_image = UserRoomImage.new(user_room_image_params)   
  #   if @user_room_image.save  
  #    render json: @user_room_image , status: :created, location: api_v1_users_url(@user_room_image) 
  #   else   
  #      render json: @user_room_image.errors, status: :unprocessable_entity
  #   end   
  # end  

  def create    
    @user_room_image = UserRoomImage.new
    @room_images = params[:room_image_id]
    @user_id = User.last.id
    
    @room_images.each do |v|

    @user_room_image.room_image_id = v
      @user_room_image.user_id = @user_id

      puts v

        if @user_room_image.save!
          # render json: @user_room_image , status: :created
        # else   
        puts "saveeeeeeeee"
           # render json: @user_room_image.errors, status: :unprocessable_entity
        end   
      end 
  end  



  def edit 
    @user_room_image = UserRoomImage.find(params[:id]) 
      render json: @user_room_image

  end 
   
  def update   
    @user_room_image = UserRoomImage.find(params[:id])   
    if @user_room_image.update_attributes(user_room_image_params)   
    else     
    render json: @user_room_image.errors, status: :unprocessable_entity
    end   
  end   

  
 
  def destroy
    @user_room_image = UserRoomImage.find(params[:id])  
    @user_room_image.delete     
  end   

  private
  def set_room
   @user_room_image = UserRoomImage.find(params[:id])
  end
   
  private
  def user_room_image_params   
    params.require(:user_room_image).permit(:user_id, :room_image_id)   
  end   
  

   
end  
