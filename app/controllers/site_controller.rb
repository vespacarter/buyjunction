class SiteController < ApplicationController

	def index
		@items = Item.all.order(:expiration_date)
	end

    def search
    	@items = Item.search(params[:search])
    end

    def categories
    	@items = Item.where(category:  params[:category])
    end


end
