class Project < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :desc, :tags, :thumb, :release_time
  has_many :works
end
