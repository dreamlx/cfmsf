class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :work_id
      t.string :cover_image
      t.timestamps
    end
  end
end
