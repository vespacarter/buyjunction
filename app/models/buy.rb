class Buy < ActiveRecord::Base
	belongs_to :item
	belongs_to :user

#	def self.get_by_buyer(user)
#		results = where(:buyer_id => user)
#	end

	def self.is_new?(user,item)
		results = where(:user_id => user).where(:item_id => item)
		if (results.count == 0)
			return :true
		else
			return :false
		end
	end

	def self.get_by_user_and_item(user,item)
		where(:user_id => user).where(:item_id => item).first
	end

	def self.get_users_by_item_id(item_id)
		users = []
		buys = where(:item_id => item_id)
		buys.each do |buy|
			users.push(buy.buyer_id)
		end
		users
	end

	def self.destroy_by_item(item)
		buys = item.buys
		buys.each do |buy|
			buy.destroy
		end
	end

	def set_payment
		self.toggle(:payment_sent)
	end

	def paymentconfirm
		self.toggle(:payment_received)
	end

	def check_confirmed_payments
		if ((self.item.buys.where(payment_received: true).count) == (self.item.buys.count))
		 	self.item.open_to_send = true
		 	self.item.open_to_pay = false
		else
		 	self.item.open_to_send = false
		 	self.item.open_to_pay = true
		end
		self.item.save
	end

	def set_item
		self.toggle(:item_sent)
	end

	def itemconfirm
		self.toggle(:item_received)
	end
	
	def check_confirmed_items
		if ((self.item.buys.where(item_received: true).count) == (self.item.buys.count))
		 	self.item.open_to_send = false
		 	self.item.all_sent = true
		else
		 	self.item.open_to_send = true
		 	self.item.all_sent = false
		end
		self.item.save
	end

	def voted
		self.marked_as_voted = true
	end

	def is_voted?
		self.marked_as_voted
	end
end
