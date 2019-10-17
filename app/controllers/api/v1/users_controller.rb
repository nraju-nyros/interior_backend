class Api::V1::UsersController < ApplicationController
  # before_action :authorize_request, except: :create
  # before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

   def change_password
    if params[:user][:password].present?
      @user.update_attributes(params[:user])
      redirect_to root_path, notice: "Success!"
    else
      flash.now.alert "Please enter password!"
      render "change_password"
    end
  end


  def update   
    @user = User.find(params[:id])   
    if @user.update_attributes(user_params)   
    else     
    render json: @user.errors, status: :unprocessable_entity
    end   
  end   

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

 

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :username, user_requirements_attributes: [:name, :email, :user_type, user_room_images_attributes: [:room_image_id, :name], user_room_types_attributes: [:room_type_id, :name, :content]])   
  end   
   
end 





