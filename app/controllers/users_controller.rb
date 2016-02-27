class UsersController < ApplicationController



	def profile
    	@user = @current_user
    	@items = Item.get_by_owner(current_user)
    	@buys = User.get_active_items(current_user)
    	render 'users/profile'
  	end
end
