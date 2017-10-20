class CreateAccidents < ActiveRecord::Migration[4.2]
  def change
    create_table :accidents do |t|
      # t.date :date
      t.datetime :time
      t.string :borough
      t.integer :zip_code
      t.float :latitude
      t.float :longitude
      t.integer :num_persons_injured
      t.integer :num_persons_killed
      t.integer :num_pedestrians_killed
      t.integer :num_cyclists_killed
      t.integer :num_motorists_killed
      t.string :contributing_factors
    end
  end
end
