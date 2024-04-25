require 'faker'
# using faker to generate the names
# Locations

# NOTE: San Francisco is the center 37.7749, -122.4194 to calculate distances
# less than 30 miles
 cities_near_sf = [
  { name: 'Oakland, California', lat: 37.8044, lon: -122.2711 },
  { name: 'Sausalito, California', lat: 37.8850, lon: -122.4969 },
  { name: 'San Mateo, California', lat: 37.5630, lon: -122.3259 },
  { name: 'Berkeley, California', lat: 37.8692, lon: -122.2990 },
  { name: 'Mill Valley, California', lat: 37.9042, lon: -122.4794 }
]
# more than 30 miles
cities_far_sf = [
  { name: 'Sacramento, California', lat: 38.5816, lon: -121.4944 },
  { name: 'Olympia, Washington', lat: 47.0379, lon: -122.8914 },
  { name: 'Phoenix, Arizona', lat: 33.4484, lon: -112.0762 },
  { name: 'Salt Lake City, Utah', lat: 40.7578, lon: -111.8600 },
  { name: 'Denver, Colorado', lat: 39.7392, lon: -104.9903 }
]

Location.create!(cities_near_sf + cities_far_sf)

# Roles

# Dummy roles
10.times do
  Role.create!(name: Faker::Job.title)
end

# getting all the dates in April of 2024
april_dates = []
(1..30).each do |day|
  april_dates << { date: Date.new(2024, 4, day) }
end

# Job Seekers
  # random assign of non availability dates, ratings values per role and desired locations
1000.times do
  seeker = Seeker.create!({
    name: Faker::Name.name,
    availabilities_attributes: april_dates.sample(rand(1..5)),
    ratings_attributes: [
      { role: Role.order('RANDOM()').first, status: 'INTERESTED', rating: rand(1..100) },
      { role: Role.order('RANDOM()').first, status: 'INTERESTED', rating: rand(1..100) },
      { role: Role.order('RANDOM()').first, status: 'INTERESTED', rating: rand(1..100) },
    ]
  })

  seeker.locations << Location.order('RANDOM()').limit(rand(1..3))
  seeker.save!
end
