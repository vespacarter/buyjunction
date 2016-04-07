class UsersController < ApplicationController
	before_action :authenticate_user!

	def buys
		@user = current_user
		@buys = @user.buys
	end



	def profile
    	@user = current_user

    	render 'users/profile'
  	end

  	def messages
		@user = current_user
  	end


end
