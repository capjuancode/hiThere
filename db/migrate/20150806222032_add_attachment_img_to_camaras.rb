class AddAttachmentImgToCamaras < ActiveRecord::Migration
  def self.up
    change_table :camaras do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :camaras, :img
  end
end
