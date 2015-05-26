class RecipeController < ApplicationController

  def ingredient
  	
  end

  def results
  	@display = Recipe.get_recipes(params[:ingredient])
  	@ingredient_lines = @display["ingredientLines"]

  	@display2 = Recipe.get_recipes2(params[:ingredient1],params[:ingredient2])
  	@ingredient_lines2 = @display2["ingredientLines"]
  end
end
