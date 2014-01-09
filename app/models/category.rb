class Category < ActiveRecord::Base
  attr_accessible :chinese_name, :franch_name

  has_many :user_categories
  has_many :users, through: :user_categories
  has_many :articles, dependent: :destroy

  validates_uniqueness_of :chinese_name
  validates_uniqueness_of :franch_name

  after_create :set_to_admin

  private

  	def set_to_admin
  	  users = User.where(role: "admin")
  	  users.each do |user|
  	    user.categories << self
  	  end
  	end
end


