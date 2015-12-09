class AddGroupIdToCamaras < ActiveRecord::Migration
  def change
    add_column :camaras, :group_id, :integer
  end
end
