class AddUserIdToCamaras < ActiveRecord::Migration
  def change
    add_column :camaras, :user_id, :integer
  end
end
