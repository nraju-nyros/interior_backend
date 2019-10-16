class Api::V1::RoomTypesController < ApplicationController
  def index
    @roomtypes = RoomType.all
     render json: @roomtypes , status: :ok
    # binding.pry
  end
 
  def show
    @roomtype = RoomType.find(params[:id])
    render json: @roomtype , status: :ok
  end
 
  def new   
    @roomtype = RoomType.new(roomtype_params)
    rende json: @roomtype 
  end   
   
  def create   
    @roomtype = RoomType.new(roomtype_params)   
    if @roomtype.save  
     render json: @roomtype , status: :created, location: api_v1_users_url(@roomtype) 
    else   
       render json: @article.errors, status: :unprocessable_entity
    end   
  end  


  def edit 
    @roomtype = RoomType.find(params[:id]) 
    render json: @roomtype
  end 
   
  def update   
    @roomtype = RoomType.find(params[:id])   
    if @roomtype.update_attributes(roomtype_params)   
    else     
    render json: @roomtype.errors, status: :unprocessable_entity
    end   
  end   

  
 
  def destroy
    @roomtype = RoomType.find(params[:id])  
    @roomtype.delete     
  end   

  private
  def set_roomtype
   @roomtype = RoomType.find(params[:id])
  end
   
  private
  def roomtype_params   
    params.require(:roomtype).permit(:name, :image)   
  end   
  
 

 

  
   
end  
