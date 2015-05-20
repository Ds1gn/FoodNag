class CreateFoodCategories < ActiveRecord::Migration
  def change
    create_table :food_categories do |t|
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
