class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :chinese_title
      t.string :franch_title
      t.string :chinese_content
      t.string :franch_content
      t.string :status
      t.integer :category_id
      t.timestamps
    end
  end
end
