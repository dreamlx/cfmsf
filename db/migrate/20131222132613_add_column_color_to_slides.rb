class AddColumnColorToSlides < ActiveRecord::Migration
  def change
  	add_column :slides, :background_color, :string
  	add_column :slides, :font_color, :string
  	add_column :slides, :link, :string
  end
end
