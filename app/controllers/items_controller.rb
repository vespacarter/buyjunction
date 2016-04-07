class ItemsController < ApplicationController

	def new
		:authenticate_user!
		@item = Item.new
	end

	def create	
		:authenticate_user!
		item = Item.new(item_params)
		item.user_id = current_user.id
		if item.save
			redirect_to profile_path
		else
			render "new"
		end
    end

    def show
    	@item = Item.find(params[:id])
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

    def destroy
        :authenticate_user!
        itemtodestroy = Item.find(params[:id])
        Buy.destroy_by_item(itemtodestroy)  
        itemtodestroy.destroy
        redirect_to profile_path
    end

    def listusers
    	:authenticate_user!
    	@item = Item.find(params[:id])
    end

private

  	def item_params
    	params.require(:item).permit(:title, :description, :prize, :min_units, :expiration_date, :expiration_time, :seller, :seller_url, :avatar, :category, :form_of_payment, :payment_details)
  	end


end
