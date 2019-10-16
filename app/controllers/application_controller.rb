class ApplicationController < ActionController::Base
# protect_from_forgery with: :null_session
	def after_sign_in_path_for(resource)
    admin_index_path
  end

  def after_sign_out_path_for(resource)
   admin_user_session_path
  end
 
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
