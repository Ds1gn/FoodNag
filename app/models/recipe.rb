# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recipe < ActiveRecord::Base
require 'Unirest'
belongs_to :purchase
# after_create :update_purchase_id



	def self.get_recipes(ingredient)
# These code snippets use an open-source library. http://unirest.io/ruby
		response = Unirest.get "https://edamam-recipe-search-and-diet-v1.p.mashape.com/search?_app_id=75207d81&_app_key=3220a736ae2581128d020ee6e6d71d5e&q=#{ingredient}",
  		headers:{
    	"X-Mashape-Key" => "h6kenRNE9tmshGtkjQsKx6DupaXrp1bYZ2djsnqk7rqx1WUvOb",
    	"Accept" => "application/json"
  		}
		
		recipe_result = response.body
		return nil if recipe_result.blank? || recipe_result["hits"].blank?
		recipe_data = recipe_result["hits"][0]["recipe"]
		
		recipe_title = recipe_data["label"]
		recipe_image = recipe_data["image"]
		recipe_url = recipe_data["url"]

		Recipe.create(
			recipe_title: recipe_title, recipe_image: recipe_image, recipe_url: recipe_url
			)



	end

  # def update_purchase_id
  # 	self.update(purchase_id: current_user.purchases.last.id)
  # end

  def recipe_with_purchase(purchase)

  	self.purchase_id = purchase.id
  	self.save
  end




	def self.get_recipes2(ingredient, ingredient1)
# These code snippets use an open-source library. http://unirest.io/ruby
		response = Unirest.get "https://edamam-recipe-search-and-diet-v1.p.mashape.com/search?_app_id=75207d81&_app_key=3220a736ae2581128d020ee6e6d71d5e&q=#{ingredient}%2C+#{ingredient1}",
  		headers:{
    	"X-Mashape-Key" => "h6kenRNE9tmshGtkjQsKx6DupaXrp1bYZ2djsnqk7rqx1WUvOb",
    	"Accept" => "application/json"
  		}
		
		recipe_result = response.body
		recipe_result["hits"][0]["recipe"]

	end

	def recipe_when_purchased(purchased)
# These code snippets use an open-source library. http://unirest.io/ruby
		response = Unirest.get "https://edamam-recipe-search-and-diet-v1.p.mashape.com/search?_app_id=75207d81&_app_key=3220a736ae2581128d020ee6e6d71d5e&q=#{purchased}",
  		headers:{
    	"X-Mashape-Key" => "h6kenRNE9tmshGtkjQsKx6DupaXrp1bYZ2djsnqk7rqx1WUvOb",
    	"Accept" => "application/json"
  		}

  		recipe_result = response.body
		return nil if recipe_result.blank? || recipe_result["hits"].blank?
		recipe_result["hits"][0]["recipe"]


	end

end
