class Life < ActiveRecord::Base
  attr_accessible :title, :content, :author, :tag_list
  acts_as_taggable
  paginates_per 12

  has_many :comments
end
