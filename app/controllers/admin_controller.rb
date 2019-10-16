class AdminController < ApplicationController
  before_action :authenticate_admin!
	def index	
      @user_requirements = UserRequirement.all
	end
end
