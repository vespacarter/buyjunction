class SiteController < ApplicationController

	def index
		@items = Item.all
	end
end
