class BuysController < ApplicationController

	def create
		istrue = Buy.is_new?(current_user.id,params[:item_id])
		if (istrue == :true)
			buy = Buy.new
			buy.user_id = current_user.id 
			buy.item_id = params[:item_id]
			if buy.save
				item = Item.find(params[:item_id])
				item.add_buyer
				redirect_to profile_path
			else
				flash[:alert] = "No se ha podido realizar esta acción"
				redirect_to profile_path
			end
		else
			flash[:alert] = "Ya estás apuntado a esta compra"
			redirect_to profile_path
		end	
	end


	def destroy
		buytodestroy = Buy.get_by_user_and_item(current_user.id,params[:item_id])
		buytodestroy.destroy
		item = Item.find(params[:item_id])
		item.del_buyer
		redirect_to profile_path
	end

end
