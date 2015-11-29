class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :group_name
      t.references :checkin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
