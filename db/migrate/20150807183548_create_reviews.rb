class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :comment, limit: 160
      t.references :camara, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
