# db/seeds.rb

# Clear existing data
User.destroy_all
Starship.destroy_all
Booking.destroy_all

# Create Users
users = User.create!([
  { email: 'mehdi@example.com', password: 'password' },
  { email: 'grant@example.com', password: 'password' },
  { email: 'dima@example.com', password: 'password' },
  { email: 'vader@empire.com', password: 'password' },
  { email: 'obiwan@jedi.com', password: 'password' }
])

# Create Starships
starships = Starship.create!([
  { name: 'Millennium Falcon', description: 'The fastest ship in the galaxy.', weapons: 'Laser cannons, Quad laser turrets', upgrades: 'Hyperdrive, Smuggling compartments', price: 5000, mass: 100000, top_speed: 1050, user: users[1], address: 'Mos Eisley, Tatooine', latitude: 25.687243, longitude: 42.598725 },
  { name: 'X-Wing Fighter', description: 'Rebel Alliance fighter.', weapons: 'Proton torpedoes, Laser cannons', upgrades: 'Shield generator', price: 3500, mass: 12000, top_speed: 1050, user: users[0], address: 'Yavin 4', latitude: 20.865134, longitude: -89.619915 },
  { name: 'Slave I', description: 'Boba Fett’s pursuit craft.', weapons: 'Ion cannons, Seismic charges', upgrades: 'Tracking systems', price: 4500, mass: 52000, top_speed: 850, user: users[3], address: 'Kamino', latitude: -0.9067, longitude: -160.6547 },
  { name: 'TIE Fighter', description: 'Empire standard starfighter.', weapons: 'Laser cannons', upgrades: 'Twin Ion Engines', price: 2500, mass: 8000, top_speed: 1200, user: users[3], address: 'Death Star, Space', latitude: 0.0, longitude: 0.0 },
  { name: 'Star Destroyer', description: 'Empire’s capital ship.', weapons: 'Turbo lasers, Ion cannons', upgrades: 'Tractor beam', price: 10000, mass: 50000000, top_speed: 975, user: users[3], address: 'Endor', latitude: 14.654321, longitude: 22.987654 },
  { name: 'Nebulon-B Frigate', description: 'Rebel medical frigate.', weapons: 'Laser turrets', upgrades: 'Medical facilities', price: 7000, mass: 8000000, top_speed: 700, user: users[2], address: 'Hoth', latitude: 77.875, longitude: -111.75 },
  { name: 'Ebon Hawk', description: 'Ancient smuggler\'s ship.', weapons: 'Dual blasters', upgrades: 'Stealth systems', price: 4000, mass: 75000, top_speed: 1025, user: users[4], address: 'Dantooine', latitude: 39.548349, longitude: -100.728279 },
  { name: 'Naboo Royal Starship', description: 'Diplomatic cruiser.', weapons: 'None', upgrades: 'Luxury interior', price: 8000, mass: 100000, top_speed: 900, user: users[2], address: 'Naboo', latitude: -34.9285, longitude: 138.6007 },
  { name: 'AT-AT Transport', description: 'Imperial ground walker.', weapons: 'Laser cannons', upgrades: 'Heavy armor', price: 3000, mass: 86000, top_speed: 60, user: users[3], address: 'Scarif', latitude: -7.261, longitude: 112.756 },
  { name: 'Imperial Shuttle', description: 'Multi-purpose transport.', weapons: 'Laser turrets', upgrades: 'Cargo capacity', price: 3500, mass: 36000, top_speed: 850, user: users[3], address: 'Mustafar', latitude: -1.2921, longitude: 36.8219 },
  { name: 'Black Pearl', description: 'A pirate ship on Earth.', weapons: 'Cannons', upgrades: 'Reinforced hull', price: 4000, mass: 800000, top_speed: 45, user: users[1], address: 'Tortuga, Caribbean', latitude: 20.785, longitude: -72.233 },
  { name: 'USS Enterprise', description: 'Legendary starship from Starfleet.', weapons: 'Photon torpedoes', upgrades: 'Warp drive', price: 9500, mass: 4500000, top_speed: 10000, user: users[4], address: 'San Francisco, Earth', latitude: 37.7749, longitude: -122.4194 },
  { name: 'Batwing', description: 'Dark knight\'s aerial vehicle.', weapons: 'Machine guns', upgrades: 'Stealth mode', price: 5000, mass: 3000, top_speed: 1200, user: users[0], address: 'Gotham City, Earth', latitude: 40.7128, longitude: -74.006 },
  { name: 'Quinjet', description: 'Avengers transport.', weapons: 'Mini-guns', upgrades: 'Stark tech', price: 7000, mass: 15000, top_speed: 1200, user: users[0], address: 'New York, Earth', latitude: 40.7128, longitude: -74.006 },
  { name: 'Heart of Gold', description: 'Ship with infinite improbability drive.', weapons: 'Improbability missiles', upgrades: 'Luxury interior', price: 12000, mass: 250000, top_speed: 3000, user: users[4], address: 'Earth Orbit', latitude: 0.0, longitude: 0.0 },
  { name: 'Discovery One', description: 'AI-operated spacecraft.', weapons: 'None', upgrades: 'HAL 9000 system', price: 9500, mass: 1000000, top_speed: 15000, user: users[2], address: 'Jupiter Orbit', latitude: -65.8, longitude: 148.5 },
  { name: 'Firefly', description: 'Transport ship with smuggler history.', weapons: 'None', upgrades: 'Hidden cargo bays', price: 3500, mass: 60000, top_speed: 800, user: users[1], address: 'Persephone', latitude: 0.3456, longitude: -0.4567 },
  { name: 'Rocinante', description: 'Martian gunship.', weapons: 'PDCs, Torpedoes', upgrades: 'Advanced sensors', price: 8000, mass: 140000, top_speed: 1500, user: users[0], address: 'Ceres Station', latitude: -15.25, longitude: 10.56 },
  { name: 'Event Horizon', description: 'Experimental gravity drive ship.', weapons: 'None', upgrades: 'Gravity drive', price: 10000, mass: 1500000, top_speed: 2000, user: users[3], address: 'Neptune Orbit', latitude: -60.5, longitude: 23.1 },
  { name: 'Bebop', description: 'Bounty hunter\'s ship.', weapons: 'Cannons', upgrades: 'Fishing nets', price: 4500, mass: 100000, top_speed: 900, user: users[4], address: 'Mars, Outer Solar System', latitude: -4.5, longitude: 137.4 }
])

# Create Bookings
Booking.create!([
  { starship: starships[0], user: users[0], starts_date: Date.today, end_date: Date.today + 5, status: 0 },
  { starship: starships[1], user: users[1], starts_date: Date.today + 10, end_date: Date.today + 15, status: 0 },
  { starship: starships[2], user: users[2], starts_date: Date.today - 5, end_date: Date.today - 1, status: 1 },
  { starship: starships[3], user: users[3], starts_date: Date.today, end_date: Date.today + 3, status: 0 },
  { starship: starships[4], user: users[4], starts_date: Date.today + 20, end_date: Date.today + 25, status: 0 }
])

puts 'Seeding complete!'
