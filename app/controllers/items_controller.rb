class ItemsController < ApplicationController
	before_action :authenticate_user!

	def new
		@item = Item.new
	end

	def create	
		item = Item.new(item_params)
		item.owner = current_user.id
		if item.save
			redirect_to profile_path
		else
			render "new"
		end
    end

    def show
    	@item = Item.find(params[:id])
    end


private

  	def item_params
    	params.require(:item).permit(:title, :description, :prize, :min_units, :expiration_date, :expiration_time, :seller, :seller_url)
  	end


end
