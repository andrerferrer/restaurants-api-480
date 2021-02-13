puts 'creating models'

User.create!(
  email: 'player@one.com',
  password: '123456'
)

Restaurant.create!(
  name: 'Burger King',
  address: 'Everywhere',
  user: User.first
)

Restaurant.create!(
  name: 'Mc Donalds',
  address: 'Also Everywhere',
  user: User.first
)

Comment.create!(
  restaurant: Restaurant.first,
  user: User.first,
  content: "Very good and also very bad. Gives me mixed feelings and also stomach ache"
)

puts 'done'
