class Api::V1::UserTypesController < ApplicationController
  def index
    @usertypes = UserType.all
   
     render json: @usertypes , status: :ok
    # binding.pry
  end
 
  def show
     @usertype = UserType.find(params[:id])
     render json: @usertype , status: :ok
  end
 
  def new   
     @usertype = UserType.new(usertype_params)
     rende json: @usertype 
  end   
   
  def create   
    @usertype = UserType.new(usertype_params)   
    if @usertype.save  
     render json: @usertype , status: :created, location: api_v1_users_url(@usertype) 
    else   
       render json: @article.errors, status: :unprocessable_entity
    end   
  end  


  def edit 
    @usertype = UserType.find(params[:id]) 
      render json: @usertype

  end 
   
  def update   
    @usertype = UserType.find(params[:id])   
    if @usertype.update_attributes(usertype_params)   
    else     
    render json: @usertype.errors, status: :unprocessable_entity
    end   
  end   

  
 
  def destroy
    @usertype = UserType.find(params[:id])  
    @usertype.delete     
  end   

  private
  def set_usertype
   @usertype = UserType.find(params[:id])
  end
   
  private
  def usertype_params   
    params.require(:usertype).permit(:name, :content)   
  end   
  
 

 

  
   
end  
