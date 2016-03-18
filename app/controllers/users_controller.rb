class UsersController < ApplicationController
	before_action :authenticate_user!



	def profile
    	@user = current_user
    	@items = Item.get_by_owner(current_user).order(:description)
    	@buys = User.get_active_items(current_user)
    	render 'users/profile'
  	end


end
