# db/seeds.rb

# Clear existing records to avoid duplication
Booking.destroy_all
Starship.destroy_all
User.destroy_all

require "open-uri" # Pour gérer les URLs d'images

# Seed data for Users
users = [
  { email: "dima@example.com", password: "password" },
  { email: "mehdi@example.com", password: "password" },
  { email: "beven@example.com", password: "password" },
  { email: "grant@example.com", password: "password" },
  { email: "prince@example.com", password: "password" },
]

user_records = users.map { |user| User.create!(user) }

# Seed data for Starships
starships = [
  {
    name: "Falcon X",
    price: 200_000_000,
    mass: 550_000,
    top_speed: 25_000,
    user_id: user_records.sample.id,
    image_url: "https://i.pinimg.com/236x/64/14/ed/6414ed3d832cf4d88227e2a49a2290f8.jpg"
  },
  {
    name: "Star Voyager",
    price: 350_000_000,
    mass: 750_000,
    top_speed: 35_000,
    user_id: user_records.sample.id,
    image_url: "https://thumbs.dreamstime.com/b/fantasy-space-starships-galaxies-ai-illustration-304692794.jpg"
  },
  {
    name: "Nebula Cruiser",
    price: 500_000_000,
    mass: 1_000_000,
    top_speed: 40_000,
    user_id: user_records.sample.id,
    image_url: "https://thumbs.dreamstime.com/b/starships-journey-across-cosmic-microwave-background-highlighting-vast-distances-327940217.jpg"
  },
  {
    name: "Pioneer Z",
    price: 150_000_000,
    mass: 300_000,
    top_speed: 20_000,
    user_id: user_records.sample.id,
    image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlp2u5oxxjBwiTM1WuXPHd7rdbd6gSWzjm7Q&s"
  },
  {
    name: "Galaxy Explorer",
    price: 450_000_000,
    mass: 900_000,
    top_speed: 38_000,
    user_id: user_records.sample.id,
    image_url: "https://eu-images.contentstack.com/v3/assets/blt0bbd1b20253587c0/bltd07481c86d56413b/65140e45f176236bd307ea2b/alamy_20spaceship.jpg"
  },
  {
    name: "Asteroid Chaser",
    price: 250_000_000,
    mass: 600_000,
    top_speed: 28_000,
    user_id: user_records.sample.id,
    image_url: "https://static1.simpleflyingimages.com/wordpress/wp-content/uploads/2024/04/artboard-beechcraft_.jpg"
  },
  {
    name: "Solar Wind Rider",
    price: 300_000_000,
    mass: 720_000,
    top_speed: 32_000,
    user_id: user_records.sample.id,
    image_url: "https://images.squarespace-cdn.com/content/v1/6440d46855729532d4bccedc/69791efd-b250-40ad-9563-e52d90a95411/1.jpg"
  },
  {
    name: "Cosmic Glider",
    price: 400_000_000,
    mass: 850_000,
    top_speed: 36_000,
    user_id: user_records.sample.id,
    image_url: "https://assetsio.gnwcdn.com/The-Last-Starship-spring-2023.jpg"
  },
  {
    name: "Stellar Phoenix",
    price: 600_000_000,
    mass: 1_200_000,
    top_speed: 42_000,
    user_id: user_records.sample.id,
    image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4ewIQYZEbxqHATTq8AwqRD_PwngIzEYVSfA&s"
  },
  {
    name: "Quantum Voyager",
    price: 750_000_000,
    mass: 1_500_000,
    top_speed: 45_000,
    user_id: user_records.sample.id,
    image_url: "https://static0.gamerantimages.com/wordpress/wp-content/uploads/2023/04/star-trek-main.jpg"
  }
]

starship_records = starships.map do |starship|
  record = Starship.create!(
    name: starship[:name],
    price: starship[:price],
    mass: starship[:mass],
    top_speed: starship[:top_speed],
    user_id: starship[:user_id]
  )
  file = URI.open(starship[:image_url])
  record.photo.attach(io: file, filename: "#{starship[:name].parameterize}.jpg", content_type: "image/jpeg")
  record
end

# Seed data for Bookings
bookings = [
  { user_id: user_records.sample.id, starship_id: starship_records.sample.id, starts_date: Date.today, end_date: Date.today + 5, status: 0 },
  { user_id: user_records.sample.id, starship_id: starship_records.sample.id, starts_date: Date.today + 3, end_date: Date.today + 10, status: 1 },
  { user_id: user_records.sample.id, starship_id: starship_records.sample.id, starts_date: Date.today + 1, end_date: Date.today + 7, status: 0 },
  { user_id: user_records.sample.id, starship_id: starship_records.sample.id, starts_date: Date.today + 2, end_date: Date.today + 8, status: 1 },
  { user_id: user_records.sample.id, starship_id: starship_records.sample.id, starts_date: Date.today + 4, end_date: Date.today + 9, status: 0 }
]

bookings.each do |booking|
  Booking.create!(booking)
end

puts "Seeded #{User.count} users, #{Starship.count} starships, and #{Booking.count} bookings!"
