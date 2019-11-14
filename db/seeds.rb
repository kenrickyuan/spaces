puts "Destroying all users, spaces, and bookings..."

User.destroy_all
Space.destroy_all
Booking.destroy_all

puts "Creating 10 users!"

# User for testing
User.create!(
  name: 'Kristina',
  email: 'kristina_head@icloud.com',
  password: 'testing123'
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

space_name = ["Fantastic NYC warehouse, corner of Central Park!", "Pop House 4min walk to L train 12mins to Manhattan", "LARGE Midtown Manhattan Apartment!", "Sunny, Modern dinning room in East Village!", "Exposed Brick Brownstone Apt!", "FULLY Furnished Studio In Manhattan!", "Contemporary, Cozy rooftop", "Private garden In Manhattan", "LARGE SUNNY ROOM, 15MINS TO NYC", "Studio Apartment Minutes Away From Times Square"]
categories = ["house party", "wedding", "festival", "business", "dinner party", "drinks", "birthday", "coffee/high tea", "surprise", "baby shower", "celebration", "bridal shower", "weekend trip", "bbq"]

10.times do |i|
  user = User.all.sample

  space = Space.new(
    owner: user,
    description: "A beautiful space.

    Perfectly situated a block from Central Park, Columbus Circle, Time Warner Center, Whole Foods, Equinox Gym and multiple dining options. All major subway lines (A,B,C,D,E,N,Q,R,W and 1) are right there!

    Guests have access to all facilities, including wifi!",
    location: "New York",
    category: categories.sample,
    price_per_hour: rand(1..100),
    max_occupancy: rand(1..100)
    )

  position = i - 1
  space.name = space_name[position]
  space.save!
end

puts "Creating 10 bookings!"

10.times do
  user = User.all.sample
  space = Space.all.sample

  booking = Booking.new(
    user: user,
    space: space,
    start_time: Faker::Time.forward(days: rand(1..5),  period: :day, format: :long),
    end_time: Faker::Time.forward(days: rand(6..10),  period: :evening, format: :long)
    )
  booking.save!
end

puts "Database populated :)"
