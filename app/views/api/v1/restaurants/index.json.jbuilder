json.array!(@restaurants) do |restaurant|
  json.extract!(restaurant, :id, :name, :address)
end

# [
#   {id
#   name
#   address},
#   {id
#   name
#   address}

# ]