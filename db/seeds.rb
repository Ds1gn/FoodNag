FoodCategory.create(:name => "Fruits", :image => "")

FoodCategory.create(:name => "Vegetable", :image => "")

FoodCategory.create(:name => "Meats", :image => "")

FoodCategory.create(:name => "Dairy", :image => "")


fruit = FoodCategory.find_by_name("Fruits")
vegetable = FoodCategory.find_by_name("Vegetable")
meat = FoodCategory.find_by_name("Meats")
seafood = FoodCategory.find_by_name("Seafood")
dairy = FoodCategory.find_by_name("Dairy")

Food.create(:name => "banana", :food_category => fruit, :image => "http://upload.wikimedia.org/wikipedia/commons/4/4c/Bananas.jpg", :shelf_life => 7)
Food.create(:name => "watermelon", :food_category => fruit, :image => "", :shelf_life => 9)
Food.create(:name => "avocado", :food_category => fruit, :image => "", :shelf_life => 4)
Food.create(:name => "peaches", :food_category => fruit, :image => "", :shelf_life => 5)
Food.create(:name => "apple", :food_category => fruit, :image => "", :shelf_life => 28)
Food.create(:name => "pineapple", :food_category => fruit, :image => "", :shelf_life => 5)
Food.create(:name => "strawberry", :food_category => fruit, :image => "", :shelf_life => 5)
Food.create(:name => "orange", :food_category => fruit, :image => "", :shelf_life => 18)


Food.create(:name => "carrots", :food_category => vegetable, :image => "", :shelf_life => 28)
Food.create(:name => "broccoli", :food_category => vegetable, :image => "", :shelf_life => 14)
Food.create(:name => "onion", :food_category => vegetable, :image => "", :shelf_life => 35)
Food.create(:name => "mushroom", :food_category => vegetable, :image => "", :shelf_life => 8)
Food.create(:name => "spinach", :food_category => vegetable, :image => "", :shelf_life => 8)
Food.create(:name => "celery", :food_category => vegetable, :image => "", :shelf_life => 28)
Food.create(:name => "spinach", :food_category => vegetable, :image => "", :shelf_life => 8)


Food.create(:name => "chicken", :food_category => meat, :image => "", :shelf_life => 2)
Food.create(:name => "beef", :food_category => meat, :image => "", :shelf_life => 2)
Food.create(:name => "pork", :food_category => meat, :image => "", :shelf_life => 2)
Food.create(:name => "turkey", :food_category => meat, :image => "", :shelf_life => 1)
Food.create(:name => "sliced turkey", :food_category => meat, :image => "", :shelf_life => 1)


Food.create(:name => "shrimp", :food_category => seafood, :image => "", :shelf_life => 2)
Food.create(:name => "salmon", :food_category => seafood, :image => "", :shelf_life => 2)
Food.create(:name => "lobster", :food_category => seafood, :image => "", :shelf_life => 2)
Food.create(:name => "tilapia", :food_category => seafood, :image => "", :shelf_life => 2)
Food.create(:name => "tuna", :food_category => seafood, :image => "", :shelf_life => 2)


Food.create(:name => "milk", :food_category => dairy, :image => "", :shelf_life => 10)
Food.create(:name => "eggs", :food_category => dairy, :image => "", :shelf_life => 28)