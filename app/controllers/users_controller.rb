class UsersController < ApplicationController
	before_action :authenticate_user!



	def profile
    	@user = current_user
    	@buys = User.get_active_items(current_user)
    	render 'users/profile'
  	end


end
