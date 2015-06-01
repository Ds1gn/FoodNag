class RecipeController < ApplicationController


  def ingredient
    @purchases = Purchase.all
  end

  def show_recipes
  	@display = Recipe.get_recipes(params[:ingredient])

  	@ingredient_lines = @display["ingredientLines"]

  	@display2 = Recipe.get_recipes2(params[:ingredient1],params[:ingredient2])
  	@ingredient_lines2 = @display2["ingredientLines"]
  end

  

 
  private
  def set_recipe
  	Recipe.find(params[:id])
  end

  def recipe_params
  	params.require(:recipe).permit(:recipe_title, :recipe_label, :recipe_image, :recipe_url, :recipe_ingredient)
  end

end
