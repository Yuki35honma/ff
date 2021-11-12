class CreateWarePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :ware_photos do |t|
      t.string :image, null: false
      t.references :ware_contents, foreign_key: true, null: false
      t.timestamps
    end
  end
end
