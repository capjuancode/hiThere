class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :user_id
      t.string :location_name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
