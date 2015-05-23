class RecipeController < ApplicationController

  def ingredient
  	
  end

  def results
  	@display = Recipe.get_recipes(params[:ingredient])
  end
end
