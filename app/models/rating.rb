class Rating < ApplicationRecord
  belongs_to :seeker
  belongs_to :role
end
