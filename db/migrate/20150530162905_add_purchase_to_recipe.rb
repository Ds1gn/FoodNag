class AddPurchaseToRecipe < ActiveRecord::Migration
  def change
    add_reference :recipes, :purchase, index: true, foreign_key: true
    add_column :recipes, :recipe_title, :string
    add_column :recipes, :recipe_label, :string
    add_column :recipes, :recipe_image, :string
    add_column :recipes, :recipe_url, :string
    add_column :recipes, :recipe_ingredient, :string
  end
end
