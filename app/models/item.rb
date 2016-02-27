class Item < ActiveRecord::Base

	def self.get_by_owner(user)
		results = where(:owner => user)
	end

	def self.get_by_buy(buy)
		result = find(buy.item_id)
	end
end
