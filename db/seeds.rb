# db/seeds.rb
require "open-uri"
# Clear existing data
User.destroy_all
Starship.destroy_all
Booking.destroy_all
# Create Users
users = User.create!([
  { username: "mehdiculous", email: 'mehdi@example.com', password: 'password' },
  { username: "heartless_beven", email: 'grant@example.com', password: 'password' },
  { username: "dimakaar", email: 'dima@example.com', password: 'password' },
  { username: "iamyourdaddy", email: 'vader@empire.com', password: 'password' },
  { username: "typeshii", email: 'obiwan@jedi.com', password: 'password' }
])
# Placeholder image URL
image_urls = [
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/tpbtvzb0qupr9skg80t8.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/qhnyuogdegckvu3r8di7.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/xj2mmshkxp31e2erkexl.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/yb0h3y68dzpvspkecrtz.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/mvo1yfr8fs4lmymb6urw.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/ju1ru5tiyog75txdyxna.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/hjohb6lk5ongwk4ox0xq.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/x8rq22cblatu38ia7ghz.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872772/starships/eypoc5bvlcztv4qgcu1b.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872772/starships/ci1uxd6qeuprqgipcb3b.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872772/starships/wdii6dwhq658igzhs332.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872772/starships/s6rqmdtd6dtoez5abbkq.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872772/starships/ixo0jyzu3v6hvmepbemn.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872772/starships/tbjkokrrynqkp641u49o.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/tpbtvzb0qupr9skg80t8.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/qhnyuogdegckvu3r8di7.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/xj2mmshkxp31e2erkexl.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872773/starships/x8rq22cblatu38ia7ghz.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872772/starships/eypoc5bvlcztv4qgcu1b.png",
  "https://res.cloudinary.com/datfrkg4n/image/upload/v1732872772/starships/ci1uxd6qeuprqgipcb3b.png",
]
# Create Starships
starships = [
  { name: 'Millennium Falcon', description: 'The fastest ship in the galaxy.', weapons: 'Laser cannons, Quad laser turrets', upgrades: 'Hyperdrive, Smuggling compartments', price: 50000000, mass: 100000, top_speed: 1050, user: users[1], address: 'Mos Eisley, Tatooine', latitude: 25.687243, longitude: 42.598725 },
  { name: 'X-Wing Fighter', description: 'Rebel Alliance fighter.', weapons: 'Proton torpedoes, Laser cannons', upgrades: 'Shield generator', price: 350000000, mass: 12000, top_speed: 1050, user: users[0], address: 'Yavin 4', latitude: 20.865134, longitude: -89.619915 },
  { name: 'Slave I', description: 'Boba Fett’s pursuit craft.', weapons: 'Ion cannons, Seismic charges', upgrades: 'Tracking systems', price: 4500000, mass: 52000, top_speed: 850, user: users[3], address: 'Kamino', latitude: -0.9067, longitude: -160.6547 },
  { name: 'TIE Fighter', description: 'Empire standard starfighter.', weapons: 'Laser cannons', upgrades: 'Twin Ion Engines', price: 25000000, mass: 8000, top_speed: 1200, user: users[3], address: 'Death Star, Space', latitude: 0.0, longitude: 0.0 },
  { name: 'Star Destroyer', description: 'Empire’s capital ship.', weapons: 'Turbo lasers, Ion cannons', upgrades: 'Tractor beam', price: 10000000, mass: 50000000, top_speed: 975, user: users[3], address: 'Endor', latitude: 14.654321, longitude: 22.987654 },
  { name: 'Nebulon-B Frigate', description: 'Rebel medical frigate.', weapons: 'Laser turrets', upgrades: 'Medical facilities', price: 70000000, mass: 8000000, top_speed: 700, user: users[2], address: 'Hoth', latitude: 77.875, longitude: -111.75 },
  { name: 'Ebon Hawk', description: 'Ancient smuggler\'s ship.', weapons: 'Dual blasters', upgrades: 'Stealth systems', price: 400000000, mass: 75000, top_speed: 1025, user: users[4], address: 'Dantooine', latitude: 39.548349, longitude: -100.728279 },
  { name: 'Naboo Royal Starship', description: 'Diplomatic cruiser.', weapons: 'None', upgrades: 'Luxury interior', price: 800000000, mass: 100000, top_speed: 900, user: users[2], address: 'Naboo', latitude: -34.9285, longitude: 138.6007 },
  { name: 'AT-AT Transport', description: 'Imperial ground walker.', weapons: 'Laser cannons', upgrades: 'Heavy armor', price: 30000000, mass: 86000, top_speed: 60, user: users[3], address: 'Scarif', latitude: -7.261, longitude: 112.756 },
  { name: 'Imperial Shuttle', description: 'Multi-purpose transport.', weapons: 'Laser turrets', upgrades: 'Cargo capacity', price: 350000000, mass: 36000, top_speed: 850, user: users[3], address: 'Mustafar', latitude: -1.2921, longitude: 36.8219 },
  { name: 'Black Pearl', description: 'A pirate ship on Earth.', weapons: 'Cannons', upgrades: 'Reinforced hull', price: 400000000, mass: 800000, top_speed: 45, user: users[1], address: 'Tortuga, Caribbean', latitude: 20.785, longitude: -72.233 },
  { name: 'USS Enterprise', description: 'Legendary starship from Starfleet.', weapons: 'Photon torpedoes', upgrades: 'Warp drive', price: 95000000, mass: 4500000, top_speed: 10000, user: users[4], address: 'San Francisco, Earth', latitude: 37.7749, longitude: -122.4194 },
  { name: 'Batwing', description: 'Dark knight\'s aerial vehicle.', weapons: 'Machine guns', upgrades: 'Stealth mode', price: 500000000, mass: 3000, top_speed: 1200, user: users[0], address: 'Gotham City, Earth', latitude: 40.7128, longitude: -74.006 },
  { name: 'Quinjet', description: 'Avengers transport.', weapons: 'Mini-guns', upgrades: 'Stark tech', price: 70000000, mass: 15000, top_speed: 1200, user: users[0], address: 'New York, Earth', latitude: 40.7128, longitude: -74.006 },
  { name: 'Heart of Gold', description: 'Ship with infinite improbability drive.', weapons: 'Improbability missiles', upgrades: 'Luxury interior', price: 12000, mass: 250000, top_speed: 3000, user: users[4], address: 'Earth Orbit', latitude: 0.0, longitude: 0.0 },
  { name: 'Discovery One', description: 'AI-operated spacecraft.', weapons: 'None', upgrades: 'HAL 9000 system', price: 950000000, mass: 1000000, top_speed: 15000, user: users[2], address: 'Jupiter Orbit', latitude: -65.8, longitude: 148.5 },
  { name: 'Firefly', description: 'Transport ship with smuggler history.', weapons: 'None', upgrades: 'Hidden cargo bays', price: 35000000, mass: 60000, top_speed: 800, user: users[1], address: 'Persephone', latitude: 0.3456, longitude: -0.4567 },
  { name: 'Rocinante', description: 'Martian gunship.', weapons: 'PDCs, Torpedoes', upgrades: 'Advanced sensors', price: 800000000, mass: 140000, top_speed: 1500, user: users[0], address: 'Ceres Station', latitude: -15.25, longitude: 10.56 },
  { name: 'Event Horizon', description: 'Experimental gravity drive ship.', weapons: 'None', upgrades: 'Gravity drive', price: 100000000, mass: 1500000, top_speed: 2000, user: users[3], address: 'Neptune Orbit', latitude: -60.5, longitude: 23.1 },
  { name: 'Bebop', description: 'Bounty hunter\'s ship.', weapons: 'Cannons', upgrades: 'Fishing nets', price: 450000000, mass: 100000, top_speed: 900, user: users[4], address: 'Mars, Outer Solar System', latitude: -4.5, longitude: 137.4 }
]
starships.each_with_index do |starship_attributes, index|
  starship = Starship.create!(starship_attributes)
  starship.photo.attach(io: URI.open(image_urls[index]), filename: "placeholder.jpg", content_type: "image/jpeg")
end
# Create Bookings
Booking.create!([
  { starship: Starship.first, user: users[0], starts_date: Date.today, end_date: Date.today + 5, status: 0 },
  { starship: Starship.second, user: users[1], starts_date: Date.today + 10, end_date: Date.today + 15, status: 0 },
  { starship: Starship.third, user: users[2], starts_date: Date.today - 5, end_date: Date.today - 1, status: 1 },
  # Add more bookings as needed...
])
puts 'Seeding complete!'
