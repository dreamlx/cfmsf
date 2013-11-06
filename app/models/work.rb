class Work < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :desc, :content, :thumb, :tag_list, :project_id, :albums
  acts_as_taggable
  mount_uploader :thumb, AvatarUploader
  belongs_to :project
  has_many :albums
  paginates_per 12
end
