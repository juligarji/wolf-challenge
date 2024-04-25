class CreateSeekersLocations < ActiveRecord::Migration[7.1]
  def change
    # many to many relationship between Job Seekers and Locations
    create_table :seekers_locations do |t|
      t.references :seeker, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
