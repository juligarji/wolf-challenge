class Seeker < ApplicationRecord
  has_and_belongs_to_many :locations, join_table: 'seekers_locations'
  has_many :availabilities

  has_many :ratings
  has_many :roles, through: :ratings
  accepts_nested_attributes_for :locations, :availabilities, :ratings
end
