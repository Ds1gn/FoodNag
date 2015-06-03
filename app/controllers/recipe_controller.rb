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

    @recipe_food1 = Recipe.when_searched1(params[:ingredients])
    @ingredient_lines = @recipe_food1["ingredientLines"]

    @recipe_food2 = Recipe.when_searched2(params[:ingredients])
    @ingredient_lines = @recipe_food2["ingredientLines"]

    @recipe_food3 = Recipe.when_searched3(params[:ingredients1],params[:ingredients2])
    @ingredient_lines2 = @recipe_food3["ingredientLines"]

    @recipe_food4 = Recipe.when_searched4(params[:ingredients1],params[:ingredients2])
    @ingredient_lines2 = @recipe_food4["ingredientLines"]

    @recipe_food5 = Recipe.when_searched5(params[:ingredients2],params[:ingredients2])
    @ingredient_lines2 = @recipe_food5["ingredientLines"]

  end

  private
  def set_recipe
    Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_label, :recipe_image, :recipe_url, :recipe_ingredient)
  end

end
