puts 'Destroying all users, spaces, and bookings...'

User.destroy_all
Space.destroy_all
Booking.destroy_all

puts 'Creating 20 users!'

# User for testing and demo
User.create!(
  name: 'Mark',
  email: 'mark_ruffalo@icloud.com',
  password: 'testing123',
  remote_photo_url: "https://res.cloudinary.com/kenrick/image/upload/v1573818339/Mark_Ruffalo_n1gb57.png"
  )

# Additional random users
20.times do
  user = User.new(
    name: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    remote_photo_url: "https://res.cloudinary.com/kenrick/image/upload/v1573819982/default-avatar_cjtvsk.png"
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
    price_per_hour: rand(30..100),
    max_occupancy: rand(5..150)
    )

  position = i - 1
  space.name = space_name[position]
  space.save!
end

puts 'Creating images for spaces'

25.times do |i|
  SpaceAttachment.create!(
    space: Space.find(i + 1),
    remote_photo_url: "http://image1.gardenersworld.com/65781.JPG?tag=5dc8d36c-02bf-4cc0-a78d-c5b556c7cdc5"
    )

  SpaceAttachment.create!(
    space: Space.find(i + 1),
    remote_photo_url: "https://i.pinimg.com/originals/e7/56/c6/e756c61d949fa7975673af1513faab9d.jpg"
    )

  SpaceAttachment.create!(
    space: Space.find(i + 1),
    remote_photo_url: "https://www.tripsavvy.com/thmb/mikSkUueelr9pJOpExuXrt-mepM=/3330x2204/filters:no_upscale():max_bytes(150000):strip_icc()/hard-rock-rooftop-56a8499a5f9b58b7d0f1f4da.jpg"
    )
  i = i + 1
end

puts 'Creating 25 bookings!'

25.times do
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
