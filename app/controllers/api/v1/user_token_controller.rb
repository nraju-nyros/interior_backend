class Api::V1::UserTokenController < Knock::AuthTokenController
skip_before_action :verify_authenticity_token

  def find
   @user = User.find_by(email: params[:email])
   if @user
     render json: @user
   else
     @errors = @user.errors.full_messages
     render json: @errors
   end
  end


  
end