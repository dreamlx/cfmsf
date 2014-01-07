class ChangeColumnChineseContentAndFranchContentToArticles < ActiveRecord::Migration
  def change
  	change_column :articles, :chinese_content, :text
  	change_column :articles, :franch_content, :text
  end
end
