class Location < ApplicationRecord
  reverse_geocoded_by :lat, :lon

  scope :within_30_miles, lambda { |latitude, longitude|
    near([latitude, longitude], 30, units: :mi)
  }
end
