class AddThumbToWorks < ActiveRecord::Migration
  def change
    add_column :works, :thumb, :string
  end
end
