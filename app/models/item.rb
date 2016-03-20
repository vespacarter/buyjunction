class Item < ActiveRecord::Base
	#PaperClip Stuff
	belongs_to :user
	has_many :buys 

	has_attached_file :avatar, styles: { big: "600x600#",medium: "300x300#", thumb: "100x100#" }, default_url: "/assets/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  	#


#	def self.get_by_owner(user)
#		results = where(:owner => user)
#	end

	def self.get_by_buy(buy)
		find(buy.item_id)
	end

	def add_buyer
		self.number_of_buyers += 1
		self.update(:number_of_buyers => self.number_of_buyers)
	end

	def del_buyer
		self.number_of_buyers -= 1
		self.update(:number_of_buyers => self.number_of_buyers)
	end
end
