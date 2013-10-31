class Client < ActiveRecord::Base
  attr_accessible :company, :name, :title, :words, :pic, :service
  mount_uploader :pic, AvatarUploader
  paginates_per 20
end
