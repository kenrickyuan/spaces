puts "Destroying all users, spaces and bookings..."
User.destroy_all
Space.destroy_all
Booking.destroy_all

puts "Creating 10 users!"

User.create!(
  name: 'Patrick',
  email: 'patrick@mail.com',
  password: '12345678901234567890'
)

10.times do
  user = User.new(
    name: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
end

puts "Creating 10 spaces!"

categories = ['house party', 'wedding', 'festival']

10.times do
  user = User.all.sample

  space = Space.new(
    owner: user,
    name: Faker::Lorem.word,
    description: Faker::Lorem.sentences(number: 3),
    location: Faker::Address.zip_code,
    category: categories.sample,
    price_per_hour: rand(1..100),
    max_occupancy: rand(1..100)
  )
  space.save!
end

puts "Creating 10 bookings!"

10.times do
  user = User.all.sample
  space = Space.all.sample

  booking = Booking.new(
    user: user,
    space: space,
    # YYYY-MM-DD HH:MI:SS
    start_time: '2019-11-12 11:30:00',
    end_time: '2020-11-12 11:30:00'
  )
  booking.save
end

puts "Database populated :)"
