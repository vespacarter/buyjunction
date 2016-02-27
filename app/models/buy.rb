class Buy < ActiveRecord::Base

	def self.get_by_buyer(user)
		results = where(:buyer_id => user)
	end

end
