class Slide < ActiveRecord::Base
  attr_accessible :name, :pic, :thumb, :background_color, :font_color, :link
  mount_uploader :pic, AvatarUploader
  mount_uploader :thumb, AvatarUploader
end
