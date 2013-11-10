class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :life_id
      t.string :content
      t.string :name
      t.string :email
      t.string :website
      t.timestamps
    end
  end
end
