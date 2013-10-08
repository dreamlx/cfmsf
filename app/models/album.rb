class Album < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :cover_image, :work_id
  belongs_to :work
  image_accessor :cover_image
  mount_uploader :cover_image, AvatarUploader
end
