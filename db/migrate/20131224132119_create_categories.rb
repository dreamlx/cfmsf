class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :chinese_name
      t.string :franch_name
      t.timestamps
    end
  end
end
