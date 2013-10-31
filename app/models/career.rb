class Career < ActiveRecord::Base
  attr_accessible :title, :color, :thumb, :desc, :responsibility, :requirements
  mount_uploader :thumb, AvatarUploader

  def responsibility_to_array
    self.responsibility.split("\r\n")
  end

  def requirments_to_array
    self.requirements.split("\r\n")
  end

end