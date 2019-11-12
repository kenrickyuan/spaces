puts "Destroying all users, spaces and bookings..."
User.destroy_all
Space.destroy_all
Booking.destroy_all

puts "Creating 10 users!"

10.times do
  user = User.new(
    name: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save
end

puts "Creating 10 spaces!"

categories = ['house party', 'wedding', 'festival']

10.times do
  space = Space.new(
    owner_id: rand(1..10),
    name: Faker::Lorem.word,
    description: Faker::Lorem.sentences(number: 3),
    location: Faker::Address.zip_code,
    category: categories.sample(1).first,
    price_per_hour: rand(1..100),
    max_occupancy: rand(1..100)
  )
  space.save
end

puts "Creating 10 bookings!"

10.times do
  booking = Booking.new(
    user_id: rand(1..10),
    space_id: rand(1..10),
    # YYYY-MM-DD HH:MI:SS
    start_time: '2019-11-12 11:30:00',
    end_time: '2020-11-12 11:30:00'
  )
  booking.save
end

puts "Database populated :)"
