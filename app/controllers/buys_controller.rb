class BuysController < ApplicationController

	def create
		istrue = Buy.is_new?(current_user.id,params[:item_id])
		if (istrue == :true)
			buy = Buy.new
			buy.buyer_id = current_user.id 
			buy.item_id = params[:item_id]
			if buy.save
				redirect_to profile_path
			else
				render 
			end
		else
			flash[:alert] = "Ya estás apuntado a esta compra"
			redirect_to profile_path
		end	
	end
end
