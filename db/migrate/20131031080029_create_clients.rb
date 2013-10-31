class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :company
      t.string :name
      t.string :title
      t.string :words
      t.string :pic
      t.integer :service
      t.timestamps
    end
  end
end
