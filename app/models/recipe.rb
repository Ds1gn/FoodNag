class Recipe < ActiveRecord::Base
require 'Unirest'


	def self.get_recipes(ingredient)
# These code snippets use an open-source library. http://unirest.io/ruby
		response = Unirest.get "https://edamam-recipe-search-and-diet-v1.p.mashape.com/search?_app_id=75207d81&_app_key=3220a736ae2581128d020ee6e6d71d5e&q=#{ingredient}",
  		headers:{
    	"X-Mashape-Key" => "h6kenRNE9tmshGtkjQsKx6DupaXrp1bYZ2djsnqk7rqx1WUvOb",
    	"Accept" => "application/json"
  		}
		
		recipe_result = response.body
	
	end
end
