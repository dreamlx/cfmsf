class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :project_id
      t.string :name
      t.string :desc
      t.string :content
      t.string :thumb
      t.string :tag
      t.timestamps
    end
  end
end
