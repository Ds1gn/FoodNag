json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :purchase_date, :food_id, :user_id
  json.url purchase_url(purchase, format: :json)
end
