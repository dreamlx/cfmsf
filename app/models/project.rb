class Project < ActiveRecord::Base
  # attr_accessible :title, :body
  paginates_per 20
  attr_accessible :name, :desc, :tags, :thumb, :release_time, :tag_list, :company, :top
  acts_as_taggable
  mount_uploader :thumb, AvatarUploader
  has_many :works

  private
  def self.random_top(size) #随机，获取，size个置顶的project
  	@projects = Project.where(top: true)
  	if @projects.size > size
  	  @projects.shuffle.sample(size)
  	else
  	  @projects.shuffle.sample(@projects.size)
  	end
  end
end
