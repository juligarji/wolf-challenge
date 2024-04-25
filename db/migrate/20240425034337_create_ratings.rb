class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    # many to many relationship table between roles and seekers
    # with information about status and rating
    create_table :ratings do |t|
      t.references :seeker, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.string :status
      t.integer :rating

      t.timestamps
    end
  end
end
