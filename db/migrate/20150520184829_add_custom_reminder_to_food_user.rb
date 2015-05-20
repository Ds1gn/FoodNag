class AddCustomReminderToFoodUser < ActiveRecord::Migration
  def change
    add_column :food_users, :custom_reminder, :integer
  end
end
