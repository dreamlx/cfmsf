class Slide < ActiveRecord::Base
  attr_accessible :name, :pic
  mount_uploader :pic, AvatarUploader
end
