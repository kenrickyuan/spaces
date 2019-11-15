puts 'Destroying all users, spaces, and bookings...'

User.destroy_all
Space.destroy_all
Booking.destroy_all

puts 'Creating 10 users!'

# Users for testing and demo
User.create!(
  name: 'Kristina',
  email: 'kristina_head@icloud.com',
  password: 'testing123'
  )

User.create!(
  name: 'Paul',
  email: 'gigantipaul@gmail.com',
  password: 'testing123'
  )

User.create!(
  name: 'Antonia',
  email: 'antonialuutz@gmx.de',
  password: 'testing123'
  )

User.create!(
  name: 'Kenrick',
  email: 'kenrickyuan@gmail.com',
  password: 'testing123'
  )

# Additional random users
10.times do
  user = User.new(
    name: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )
  user.save!
end

puts 'Creating 25 spaces!'

space_name = ["Small and sweet room, perfect for coffee catch up!", "Professional space", "MASSIVE space, use for whatever you want", "Roomy room with professional coffee machine", "PERFECT study space or meeting room!", "Pink palace <3 great for girls", "Big backgarden in centre of town", "Hipster and boujee rooftop !", "Meeting rooms", "Cool and quirky garage, 5min train to town", "Classy room, great for drinks OR meetings", "Cute AND classy space MINUTES from park", "Garden with awesome Grafitti wall and BBQ equipment!!!", "Mega fancy dinning room, great for the gram!", "Big field not far from town", "Fantastic warehouse, corner of the park!", "Pop House 4min walk to train station", "LARGE Apartment!", "Sunny, Modern dinning room in East of town!", "Exposed Brick Brownstone Apt!", "FULLY Furnished Studio In city centre!", "Contemporary, Cozy rooftop", "Private garden in the city", "LARGE SUNNY ROOM, 15MINS TO the park", "Studio Apartment Minutes Away From Station"]
locations = ['Amsterdam', 'New York']
categories = ['house party', 'wedding', 'festival', 'business', 'dinner party', 'drinks', 'birthday', 'coffee/high tea', 'surprise', 'baby shower', 'celebration', 'bridal shower', 'weekend trip', 'bbq']

25.times do |i|
  user = User.all.sample

  space = Space.new(
    owner: user,
    description: 'A beautiful space.

    Perfectly situated near local amenities and plenty of dining options nearby, if needed. All major public transport lines are right there too!

    Guests have access to all facilities, including wifi! Book now!',
    location: locations.sample,
    category: categories.sample,
    price_per_hour: rand(1..100),
    max_occupancy: rand(1..150)
    )

  position = i - 1
  space.name = space_name[position]
  space.save!
end

puts 'Creating 10 bookings!'

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

puts 'Database populated :)'
