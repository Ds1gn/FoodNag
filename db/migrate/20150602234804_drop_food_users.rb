class DropFoodUsers < ActiveRecord::Migration
  def change
    drop_table :food_users
  end
end
