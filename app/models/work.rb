class Work < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :desc, :content, :thumb, :tag_list, :project_id
  acts_as_taggable
  mount_uploader :thumb, AvatarUploader
  belongs_to :project
end
