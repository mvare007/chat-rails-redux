# Destroy all Models

puts "Destroying all Messages"
Message.destroy_all

puts "Destroying all Channels"
Channel.destroy_all

puts "Destroying all Users"
User.destroy_all


# Users

puts "Creating 60 users"

nicknames = [
              Faker::Games::Pokemon.name,
              Faker::JapaneseMedia::DragonBall.character,
              Faker::Movies::LordOfTheRings.character,
              Faker::TvShows::Simpsons.character,
              Faker::TvShows::BreakingBad.character,
              Faker::TvShows::FamilyGuy.character,
              Faker::Movies::HarryPotter.character,
              Faker::DcComics.villain
            ]

60.times do
  User.create!(
    nickname: "#{nicknames.sample }_#{rand(10..9999)}",
    password: "123456"
  )
end


# Channels

puts "Creating 2 default channels"

Channel.create!(
  name: "General"
)

Channel.create!(
  name: "Lisbon"
)

puts "Creating 18 channels"

locations = [
              Faker::TvShows::Simpsons.location,
              Faker::TvShows::FamilyGuy.location,
              Faker::Movies::LordOfTheRings.location,
              Faker::Games::Fallout.location,
              Faker::Movies::HarryPotter.location,
              Faker::Games::ElderScrolls.region,
              Faker::TvShows::GameOfThrones.city,
              Faker::Games::Zelda.location,
              Faker::Nation.capital_city
            ]

18.times do
  Channel.create!(
    name: "#{locations.sample }_#{rand(10..999)}"
  )
end


# Messages

puts "Creating 120 Messages"

messages = [
              Faker::TvShows::Simpsons.quote,
              Faker::ChuckNorris.fact,
              Faker::TvShows::Seinfeld.quote,
              Faker::TvShows::FamilyGuy.quote,
              Faker::Games::Fallout.quote,
              Faker::TvShows::SouthPark.quote,
              Faker::TvShows::DumbAndDumber.quote,
              Faker::Quote.famous_last_words,
              Faker::GreekPhilosophers.quote
            ]

120.times do
  message = Message.new(
    user: User.all.sample,
    channel: Channel.all.sample,
    content: messages.sample,
  )
  message.author = message.user.nickname
  message.save!
end
