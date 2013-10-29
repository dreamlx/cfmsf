class AddColumnTopToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :top, :boolean, :default => ""
  end
end
