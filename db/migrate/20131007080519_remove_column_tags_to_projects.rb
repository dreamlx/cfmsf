class RemoveColumnTagsToProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :tags
  end
end
