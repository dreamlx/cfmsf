class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :desc
      t.string :tags
      t.string :thumb
      t.datetime :release_time
      t.timestamps
    end
  end
end
