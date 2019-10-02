class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :image
      t.string :text
      t.string :back_image
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
