Food.create(:name => "tomato", :image => "", :shelf_life => 7, )

Food.create(:name => "squash", :image => "", :shelf_life => 5)

Food.create(:name => "pineapple", :image => "", :shelf_life => 5)

Food.create(:name => "apple", :image => "", :shelf_life => 28)

Food.create(:name => "strawberry", :image => "",  :shelf_life => 5)

FoodCategory.create(:name => "Fruits", :image => "")

FoodCategory.create(:name => "Vegetable", :image => "")

FoodCategory.create(:name => "Meats", :image => "")

FoodCategory.create(:name => "Diary", :image => "")

FoodCategory.create(:name => "Deli", :image => "")

fruit = FoodCategory.find_by_name("Fruits")

Food.create(:name => "banana", :food_category => fruit, :image => "http://upload.wikimedia.org/wikipedia/commons/4/4c/Bananas.jpg", :shelf_life => 7)
