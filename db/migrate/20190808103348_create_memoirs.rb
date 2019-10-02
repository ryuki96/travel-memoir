class CreateMemoirs < ActiveRecord::Migration[5.2]
  def change
    create_table :memoirs do |t|
      t.string :place
      t.string :image
      t.string :text
      t.integer :likes_count
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
