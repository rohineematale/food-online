class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.string   :image_type
      t.string   :imageable_type
      t.integer  :imageable_id
      t.timestamps
    end

    add_index :photos, [:imageable_type, :imageable_id]
  end
end
