class CreateSeekerAvailabilities < ActiveRecord::Migration[7.1]
  def change
    # many to many relationship to indicate non availability for Job Seekers
    create_table :seeker_availabilities do |t|
      t.references :seeker, null: false, foreign_key: true
      t.references :availability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
