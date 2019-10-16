class UsersController < ApplicationController
	def index
		@tip = NyrosForm::Builder.new(total: 100, gratuity: 'low').generate
	end
end

