class CreateFoodUsers < ActiveRecord::Migration
  def change
    create_table :food_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :food, index: true, foreign_key: true
      t.date :custom_reminder

      t.timestamps null: false
    end
  end
end
