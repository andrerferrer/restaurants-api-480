json.extract!(@restaurant, :id, :name, :address)
# metaprogramming
json.comments(@restaurant.comments) do |comment|
  json.extract!(comment, :id, :content, :user_id)
end
