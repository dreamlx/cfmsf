class CreateLeaveMessages < ActiveRecord::Migration
  def change
    create_table :leave_messages do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :comment
      t.timestamps
    end
  end
end
