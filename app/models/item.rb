class Item < ActiveRecord::Base
	#PaperClip Stuff
	belongs_to :user
	has_many :buys, dependent: :delete_all
	has_attached_file :avatar, styles: { big: "600x600#",medium: "300x300#", thumb: "100x100#" }, default_url: "/assets/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  	#
  	searchkick
  	#


	def number_of_buyers
		buys.count
	end

	def add_buyer
		self.number_of_buyers += 1
		self.update(:number_of_buyers => self.number_of_buyers)
	end

	def del_buyer
		self.number_of_buyers -= 1
		self.update(:number_of_buyers => self.number_of_buyers)
	end

	def success_percentage
		success = ((100 * self.number_of_buyers)/self.min_units).to_i
		if (success > 100)
			return 100
		else
			return success
		end
	end
end
