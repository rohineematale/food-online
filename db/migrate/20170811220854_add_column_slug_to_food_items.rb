class AddColumnSlugToFoodItems < ActiveRecord::Migration[5.0]
  def change
    add_column :food_items, :slug, :string
    add_index :food_items, :slug, unique:true
  end
end
