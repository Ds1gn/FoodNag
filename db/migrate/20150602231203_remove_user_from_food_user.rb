class RemoveUserFromFoodUser < ActiveRecord::Migration

  def change
      remove_foreign_key :food_user, :user_id
  end
end
