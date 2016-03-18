class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Paperclip stuff
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/bjlogo.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  #

  def self.get_active_items(user)
   	items = []
   	buys = Buy.get_by_buyer(user)
   	buys.each do |buy|
   		items.push(Item.get_by_buy(buy))
   	end
    items
  end
  def self.get_users_by_id(user_ids)
    users = []
    user_ids.each do |user_id|
      users.push(find(user_id))
    end
    users
  end
end
