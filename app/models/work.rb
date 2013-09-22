class Work < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :desc, :content, :thumb, :tag, :project_id
  belongs_to :project
end
