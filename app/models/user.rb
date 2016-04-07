class User < ActiveRecord::Base
  has_many :items
  has_many :buys, dependent: :delete_all
  has_many :messages
  has_many :scores, dependent: :delete_all


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Paperclip stuff
  has_attached_file :avatar, styles: { medium: "200x200#", thumb: "50x50#" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  #

  def self.get_active_items(user)
   	items = []
   	buys = user.buys
   	items = buys.map do |buy|
      buy.item
   	end
    items
  end


  def self.get_users_by_id(user_ids)
    users = user_ids.map do |user_id|
      find(user_id)
    end
    users
  end


  def unread_messages
    messages.where(read: false).count.to_s
  end

  def calculate_score
    total = 0
    self.scores.each do |score|
      total += score.score
    end
    returnstring = total.to_s + '/' + (5*(self.scores.count)).to_s
  end
end
