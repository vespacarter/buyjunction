class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    def self.get_active_items(user)
    	items = []
    	buys = Buy.get_by_buyer(user)
    	buys.each do |buy|
    		items.push(Item.get_by_buy(buy))
    	end
      items
    end
end
