class Article < ActiveRecord::Base
  attr_accessible :category_id, :chinese_title, :franch_title, :chinese_content, :franch_content, :status
  belongs_to :category
end
