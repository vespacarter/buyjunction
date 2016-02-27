class BuysController < ApplicationController

	def create
		buy = Buy.new
		buy.buyer_id = current_user.id 
		buy.item_id = params[:item_id]
		if buy.save
			redirect_to profile_path
		else
			render 
		end
	end
end
