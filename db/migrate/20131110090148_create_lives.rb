class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
      t.string :title
  	  t.string :content
  	  t.string :author
      t.timestamps
    end
  end
end
