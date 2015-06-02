class RecipeController < ApplicationController
# before_action :is_advertiser?

  def ingredient
    @purchases = Purchase.all
    @food_categories = FoodCategory.all
  end

  def show_recipes
    @display = Recipe.get_recipes(params[:ingredient])

    @ingredient_lines = @display["ingredientLines"]

    @display2 = Recipe.get_recipes2(params[:ingredient1],params[:ingredient2])
    @ingredient_lines2 = @display2["ingredientLines"]
  end

  def results
    @recipe_food = Recipe.when_searched(params[:ingredients])

    @ingredient_lines = @recipe_food["ingredientLines"]

    @recipe_food2 = Recipe.when_searched2(params[:ingredients1],params[:ingredients2])
    @ingredient_lines2 = @recipe_food2["ingredientLines"]
  end
 
  private
  def set_recipe
    Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_label, :recipe_image, :recipe_url, :recipe_ingredient)
  end

end
