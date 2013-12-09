class AddThumbToSlides < ActiveRecord::Migration
  def change
  	add_column :slides, :thumb, :string
  end
end
