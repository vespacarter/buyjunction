class ItemsController < ApplicationController

	def new
		:authenticate_user!
		@item = Item.new
	end

	def create	
		:authenticate_user!
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
    	@owner = User.find(@item.owner)
    end

    def edit
    	:authenticate_user!
    	@item = Item.find(params[:id])
    end 

    def update
    	:authenticate_user!
		item = Item.find(params[:id])
		if item.update(item_params)
			redirect_to item_path
		else
			render edit_item_path
		end
    end

    def listusers
    	:authenticate_user!
    	@item = Item.find(params[:id])
    	user_ids = Buy.get_users_by_item_id(@item.id)
    	@users = User.get_users_by_id(user_ids)
    end

private

  	def item_params
    	params.require(:item).permit(:title, :description, :prize, :min_units, :expiration_date, :expiration_time, :seller, :seller_url, :avatar)
  	end


end
