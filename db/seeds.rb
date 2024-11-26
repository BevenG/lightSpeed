# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_title|
#     MovieGenre.find_or_create_by!(title: genre_title)
#   end
# db/seeds.rb

# Clear existing records to avoid duplicates when seeding repeatedly
# db/seeds.rb

# Clear existing records to avoid duplication
Booking.destroy_all
Starship.destroy_all
User.destroy_all

# Seed data for Users
users = [
  { email: "dima@example.com", password: "password" },
  { email: "mehdi@example.com", password: "password" },
  { email: "beven@example.com", password: "password" },
  { email: "grant@example.com", password: "password" },
  { email: "prince@example.com", password: "password" }
]

user_records = users.map { |user| User.create!(user) }

# Seed data for Starships
starships = [
  {
    name: "Falcon X",
    price: 200_000_000,
    mass: 550_000,
    top_speed: 25_000,
    user_id: user_records.sample.id
    # image_url: "https://example.com/images/falcon_x.jpg"
  },
  {
    name: "Star Voyager",
    price: 350_000_000,
    mass: 750_000,
    top_speed: 35_000,
    user_id: user_records.sample.id
    # image_url: "https://example.com/images/star_voyager.jpg"
  },
  {
    name: "Nebula Cruiser",
    price: 500_000_000,
    mass: 1_000_000,
    top_speed: 40_000,
    user_id: user_records.sample.id
    # image_url: "https://example.com/images/nebula_cruiser.jpg"
  },
  {
    name: "Pioneer Z",
    price: 150_000_000,
    mass: 300_000,
    top_speed: 20_000,
    user_id: user_records.sample.id
    # image_url: "https://example.com/images/pioneer_z.jpg"
  },
  {
    name: "Galaxy Explorer",
    price: 450_000_000,
    mass: 900_000,
    top_speed: 38_000,
    user_id: user_records.sample.id
    # image_url: "https://example.com/images/galaxy_explorer.jpg"
  },
  {
    name: "Asteroid Chaser",
    price: 250_000_000,
    mass: 600_000,
    top_speed: 28_000,
    user_id: user_records.sample.id
    # image_url: "https://example.com/images/asteroid_chaser.jpg"
  },
  {
    name: "Solar Wind Rider",
    price: 300_000_000,
    mass: 720_000,
    top_speed: 32_000,
    user_id: user_records.sample.id
    # image_url: "https://example.com/images/solar_wind_rider.jpg"
  },
  {
    name: "Cosmic Glider",
    price: 400_000_000,
    mass: 850_000,
    top_speed: 36_000,
    user_id: user_records.sample.id
    # image_url: "https://example.com/images/cosmic_glider.jpg"
  },
  {
    name: "Stellar Phoenix",
    price: 600_000_000,
    mass: 1_200_000,
    top_speed: 42_000,
    user_id: user_records.sample.id
    # image_url: "https://example.com/images/stellar_phoenix.jpg"
  },
  {
    name: "Quantum Voyager",
    price: 750_000_000,
    mass: 1_500_000,
    top_speed: 45_000,
    user_id: user_records.sample.id
    # image_url: "https://example.com/images/quantum_voyager.jpg"
  }
]

starship_records = starships.map { |starship| Starship.create!(starship) }

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
