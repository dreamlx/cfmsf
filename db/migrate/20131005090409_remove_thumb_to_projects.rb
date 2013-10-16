class RemoveThumbToProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :thumb
  end
end
