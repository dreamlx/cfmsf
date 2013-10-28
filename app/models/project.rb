class Project < ActiveRecord::Base
  # attr_accessible :title, :body
  paginates_per 20
  attr_accessible :name, :desc, :tags, :thumb, :release_time, :tag_list, :company, :top
  acts_as_taggable
  mount_uploader :thumb, AvatarUploader
  has_many :works
end
