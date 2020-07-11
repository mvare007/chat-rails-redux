# Destroy all Models

puts "Destroying all Messages"
Message.destroy_all

puts "Destroying all Channels"
Channel.destroy_all

puts "Destroying all Users"
User.destroy_all


# Users

puts "Creating 5 users"

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456"
  )
end


# Channels

puts "Creating 3 channels"

Channel.create!(
  name: "General"
)

Channel.create!(
  name: "Lisbon"
)

Channel.create!(
  name: "Ruby"
)


# Messages

puts "Creating 10 Messages"

10.times do
  Message.create!(
    user: User.all.sample,
    channel: Channel.all.sample,
    content: Faker::ChuckNorris.fact
  )
end
