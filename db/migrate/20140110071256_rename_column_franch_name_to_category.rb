class RenameColumnFranchNameToCategory < ActiveRecord::Migration
  def change
  	rename_column :categories, :franch_name, :french_name
  end
end
