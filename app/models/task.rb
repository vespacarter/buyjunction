class Task < ActiveRecord::Base

	def check_for_finished_items
    items = Item.all
    time = Time.now
    date = Date.today
    items.each do |item|
      if (item.expiration_date <= date) &&  (item.expiration_time >= time) && (item.open_to_apply == true)
        item.open_to_apply = false
        if (item.min_units >= item.number_of_buyers)
            item.open_to_pay = true
        else
          item.all_sent = true
        end
      end
    end
end
