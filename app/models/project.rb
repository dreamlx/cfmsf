class Project < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :desc, :tags, :thumb, :release_time, :tag_list
  acts_as_taggable
  mount_uploader :thumb, AvatarUploader
  has_many :works
end
