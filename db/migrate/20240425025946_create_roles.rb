class CreateRoles < ActiveRecord::Migration[7.1]
  # Available Jobs to take
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
