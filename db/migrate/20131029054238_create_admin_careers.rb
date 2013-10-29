class CreateAdminCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :title
      t.string :color
      t.string :thumb
      t.string :desc
      t.string :responsibility
      t.string :requirements
      t.timestamps
    end
  end
end
