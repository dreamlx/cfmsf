class ChangeColumnContentToLifes < ActiveRecord::Migration
  def change
  	change_column :lives, :content, :text
  end
end
