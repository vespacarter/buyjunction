class Task < ActiveRecord::Base

	def self.check_for_finished_items
    	items = Item.all
    	date = Date.today
    	items.each do |item|
      		if (item.expiration_date <= date) && (item.open_to_apply == true)
        		item.open_to_apply = false
        		if (item.min_units <= item.number_of_buyers)
            		item.open_to_pay = true
        		else
          			item.closed_status	 = true
        		end
        		item.save
        	end
    	end
    end
end
