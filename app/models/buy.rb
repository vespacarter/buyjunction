class Buy < ActiveRecord::Base

	def self.get_by_buyer(user)
		results = where(:buyer_id => user)
	end

	def self.is_new?(user,item)
		results = where(:buyer_id => user).where(:item_id => item)
		if (results.count == 0)
			return :true
		else
			return :false
		end
	end

	def self.get_by_user_and_item(user,item)
		results= where(:buyer_id => user).where(:item_id => item).first
	end
end
