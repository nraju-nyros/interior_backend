class Api::V1::RoomImagesController < ApplicationController
  def index
    @rooms = RoomImage.all
     render json: @rooms , status: :ok
    # binding.pry
  end
 
  def show
     @roomimage = RoomImage.find(params[:id])
     render json: @roomimage , status: :ok
  end
 
  def new   
     @roomimage = RoomImage.new(room_params)
     rende json: @roomimage 
  end   
   
  def create   
    @roomimage = RoomImage.new(room_params)   
    if @roomimage.save  
     render json: @roomimage , status: :created, location: api_v1_users_url(@roomimage) 
    else   
       render json: @article.errors, status: :unprocessable_entity
    end   
  end  


  def edit 
    @roomimage = RoomImage.find(params[:id]) 
      render json: @roomimage

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
