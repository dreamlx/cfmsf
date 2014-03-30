class AddColumnToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :parent_id, :integer, :null => false, :default => ""
    add_column :categories, :order_no, :integer, :null => false, :default => 0
    add_column :categories, :published, :boolean, :null => false, :default => false
  end
end
