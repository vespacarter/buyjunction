class UsersController < ApplicationController
	before_action :authenticate_user!

	def buys
		@user = current_user
		@buys = User.get_active_items(current_user)
	end



	def profile
    	@user = current_user
    	@buys = User.get_active_items(current_user)
    	render 'users/profile'
  	end

  	def messages
		@user = current_user
  	end


end
