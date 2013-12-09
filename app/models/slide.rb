class Slide < ActiveRecord::Base
  attr_accessible :name, :pic, :thumb
  mount_uploader :pic, AvatarUploader
  mount_uploader :thumb, AvatarUploader
end
