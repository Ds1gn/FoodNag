class Recipe < ActiveRecord::Base
require 'Unirest'


	def self.get_recipes(ingredient)
		response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?number=10&offset=0&query=#{ingredient}",
	  	headers:{
	    "X-Mashape-Key" => "h6kenRNE9tmshGtkjQsKx6DupaXrp1bYZ2djsnqk7rqx1WUvOb",
	    "Accept" => "application/json"
	  	}
		
		recipe_result = response.body
	
	end
end
