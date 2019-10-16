class AuthenticationController < ApplicationController
  before_action :authenticate_request
  skip_before_action :authenticate_request

  def authenticate
   command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
   	  @user = User.find_by_email(params[:email])
      @user.update_attribute(:token, command.result)
      render json: { auth_token: command }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def find_user
    @user = AuthenticateUser.find_by(email: params[:email])
    if @user
      render json: @user
    else
      render json: "error"
    end
  end
end


  