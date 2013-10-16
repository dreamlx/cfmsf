class AddColumnToAlbums < ActiveRecord::Migration
  def change
	add_column :albums, :cover_image_uid,  :string
	add_column :albums, :cover_image_name, :string 
  end
end
