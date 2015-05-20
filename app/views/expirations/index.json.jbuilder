json.array!(@expirations) do |expiration|
  json.extract! expiration, :id, :food_id, :user_id, :expires_at
  json.url expiration_url(expiration, format: :json)
end
