class CreateAvailabilities < ActiveRecord::Migration[7.1]
  #  non availability dates for Job Seekers (one to many relation)
  def change
    create_table :availabilities do |t|
      t.date :date
      t.belongs_to :seeker

      t.timestamps
    end
  end
end
