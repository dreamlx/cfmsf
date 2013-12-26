class Category < ActiveRecord::Base
  attr_accessible :chinese_name, :franch_name

  has_many :user_categories
  has_many :users, through: :user_categories
  has_many :articles, dependent: :destroy

end


