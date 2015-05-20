json.array!(@food_users) do |food_user|
  json.extract! food_user, :id, :user_id, :food_id, :custom_reminder
  json.url food_user_url(food_user, format: :json)
end
