class RemoveUserFromFoodUser < ActiveRecord::Migration
  def change
    change_column :food_users, :user_id, :integer, :default => 1
  end
end
