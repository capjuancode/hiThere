class CreateGroupingTables < ActiveRecord::Migration
  def change
    create_table :grouping_tables do |t|
      t.integer :group_id
      t.integer :checkin_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
