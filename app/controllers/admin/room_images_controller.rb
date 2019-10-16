class Admin::RoomImagesController < ApplicationController
  def index
    @roomimages = RoomImage.all
  end
 
  def show
     @roomimage = RoomImage.find(params[:id])
    
  end
 
  def new   
     @roomimage = RoomImage.new(room_params)
     
  end   
   
  def create   
    @roomimage = RoomImage.new(room_params)   
    if @roomimage.save  
      admin_room_images_path
    else   
       new_room_image_path
    end   
  end  


  def edit 
    @roomimage = RoomImage.find(params[:id]) 
     
  end 
   
  def update   
    @roomimage = RoomImage.find(params[:id])   
    if @roomimage.update_attributes(room_params)   
    else     
    render json: @roomimage.errors, status: :unprocessable_entity
    end   
  end   

  
 
  def destroy
    @roomimage = RoomImage.find(params[:id])  
    @roomimage.delete     
  end   

  private
  def set_room
   @roomimage = RoomImage.find(params[:id])
  end
   
  private
  def room_params   
    params.require(:roomimage).permit(:name)   
  end   
  
 

 

  
   
end  
