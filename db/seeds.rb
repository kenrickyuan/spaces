puts "Destroying all users, spaces, and bookings..."

User.destroy_all
Space.destroy_all
Booking.destroy_all

puts "Creating 10 users!"

User.create!(
  name: 'Kristina',
  email: 'kristina_head@icloud.com',
  password: 'testing123' # Error, I tried using these credentials and I couldn't log into your icloud. Please provide the real password here.
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

array_name = ["Fantastic NYC 2 Bed, corner of Central Park!", "Pop House 4min walk to L train 12mins to Manhattan", "LARGE 2 Bedroom Midtown Manhattan Apartment!", "Sunny, Modern room in East Village!", "Exposed Brick Brownstone Apt!", "FULLY Furnished Studio In Manhattan!", "Contemporary, Cozy Retreat", "Private Bedroom In Manhattan", "LARGE SUNNY ROOM, 15MINS TO NYC", "Studio Apartment Minutes Away From Times Square"]
categories = ['house party', 'wedding', 'festival']

10.times do |i|
  user = User.all.sample

  space = Space.new(
    owner: user,
    description: "A beautiful NYC apartment. Perfectly situated a block from Central Park, Columbus Circle, Time Warner Center, Whole Foods, Equinox Gym and multiple 5-star dining options. All major subway lines (A,B,C,D,E,N,Q,R,W and 1) are right there!!

    Middle of the burgeoning nightlife of Clinton/Hell’s Kitchen, the culture of Lincoln Center and the charm of the Upper West Side. Full service luxury condo, 24 Hour security, full time doormen. Award winning formal gardens, roof decks for sun and socializing.

    <strong>The space</strong>

    This is an amazing apartment in the absolute heart of Manhattan..

    <strong>Guest access</strong>

    Guests have access the whole apartment",
    location: Faker::Address.zip_code,
    category: categories.sample,
    price_per_hour: rand(1..100),
    max_occupancy: rand(1..100)
    )

  position = i - 1
  space.name = array_name[position]
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
  booking.save!
end

puts "Database populated :)"
