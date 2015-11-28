class AddCheckinIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :checkin_id, :integer
  end
end
