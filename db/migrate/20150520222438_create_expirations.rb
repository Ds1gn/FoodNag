class CreateExpirations < ActiveRecord::Migration
  def change
    create_table :expirations do |t|
      t.references :food, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.date :expires_at

      t.timestamps null: false
    end
  end
end
