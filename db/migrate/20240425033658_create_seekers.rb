class CreateSeekers < ActiveRecord::Migration[7.1]
  # Job Seekers
  def change
    create_table :seekers do |t|
      t.string :name

      t.timestamps
    end
  end
end
