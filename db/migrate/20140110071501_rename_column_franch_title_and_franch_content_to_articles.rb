class RenameColumnFranchTitleAndFranchContentToArticles < ActiveRecord::Migration
  def change
  	rename_column :articles, :franch_title, :french_title
  	rename_column :articles, :franch_content, :french_content
  end
end
