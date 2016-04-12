class UsersController < ApplicationController
	before_action :authenticate_user!

	def buys
		@user = current_user
	end



	def profile
    	@user = current_user
  	end

  	def messages
		@user = current_user
  	end


end
