class RemoveColumnThumbToWorks < ActiveRecord::Migration
  def change
  	remove_column :works, :thumb
  end
end
