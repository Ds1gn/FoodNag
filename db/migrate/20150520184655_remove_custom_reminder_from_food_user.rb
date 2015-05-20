class RemoveCustomReminderFromFoodUser < ActiveRecord::Migration
  def change
    remove_column :food_users, :custom_reminder, :date
  end
end
