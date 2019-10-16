class Admin::RoomTypesController < ApplicationController
  def index
    @roomtypes = RoomType.all
  end
 
  def show
     @roomtype = RoomType.find(params[:id])
    
  end
 
  def new   
     @roomtype = RoomType.new(room_params)
     
  end   
   
  def create   
    @roomtype = RoomType.new(room_params)   
    if @roomtype.save  
      admin_room_images_path
    else   
       new_room_image_path
    end   
  end  


  def edit 
    @roomtype = RoomType.find(params[:id]) 
     
  end 
   
  def update   
    @roomtype = RoomType.find(params[:id])   
    if @roomtype.update_attributes(room_params)   
    else     
    render json: @roomtype.errors, status: :unprocessable_entity
    end   
  end   

  
 
  def destroy
    @roomtype = RoomType.find(params[:id])  
    @roomtype.delete     
  end   

  private
  def set_room
   @roomtype = RoomType.find(params[:id])
  end
   
  private
  def room_params   
    params.require(:roomtype).permit(:name, :image)   
  end   
  
 

 

  
   
end  
