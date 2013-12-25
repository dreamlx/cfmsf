class Category < ActiveRecord::Base
  attr_accessible :chinese_name, :franch_name

  has_many :articles
end
