# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'pry'

csv_text = File.read('lib/seeds/Deadly_Collisions.csv')
# (Rails.root.join('lib', 'seeds', 'Deadly_Collisions.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Accident.new
  d_a = row['DATE'].split("/")
  dat = d_a.map{|el| el.rjust(2,'0')}
  dat[0], dat[1] = dat[1], dat[0]
  t_a = row['TIME'].split(":")
  tim = t_a.map{|el| el.rjust(2,'0')} << "00"
  t.time = DateTime.strptime("#{dat.reverse.join('/')} #{tim.join(":")}", "%Y/%m/%d %H:%M:%S")
  t.borough = row['BOROUGH']
  t.zip_code = row['ZIP CODE']
  t.latitude = row['LATITUDE']
  t.longitude = row['LONGITUDE']
  t.num_persons_injured = row['NUMBER OF PERSONS INJURED']
  t.num_persons_killed = row['NUMBER OF PERSONS KILLED']
  t.num_pedestrians_killed = row['NUMBER OF PEDESTRIANS KILLED']
  t.num_cyclists_killed = row['NUMBER OF CYCLIST KILLED']
  t.num_motorists_killed = row['NUMBER OF MOTORIST KILLED']
  t.contributing_factors = [row['CONTRIBUTING FACTOR VEHICLE 1'], row['CONTRIBUTING FACTOR VEHICLE 2'], row['CONTRIBUTING FACTOR VEHICLE 3'], row['CONTRIBUTING FACTOR VEHICLE 4'], row['CONTRIBUTING FACTOR VEHICLE 5']].select{|fact| fact}
  t.save
  puts "#{t.time} saved"
end




# DATE,TIME,BOROUGH,ZIP CODE,LATITUDE,LONGITUDE,LOCATION,ON STREET NAME,CROSS STREET NAME,OFF STREET NAME,NUMBER OF PERSONS INJURED,NUMBER OF PERSONS KILLED,NUMBER OF PEDESTRIANS INJURED,NUMBER OF PEDESTRIANS KILLED,NUMBER OF CYCLIST INJURED,NUMBER OF CYCLIST KILLED,NUMBER OF MOTORIST INJURED,NUMBER OF MOTORIST KILLED,CONTRIBUTING FACTOR VEHICLE 1,CONTRIBUTING FACTOR VEHICLE 2,CONTRIBUTING FACTOR VEHICLE 3,CONTRIBUTING FACTOR VEHICLE 4,CONTRIBUTING FACTOR VEHICLE 5,UNIQUE KEY,VEHICLE TYPE CODE 1,VEHICLE TYPE CODE 2,VEHICLE TYPE CODE 3,VEHICLE TYPE CODE 4,VEHICLE TYPE CODE 5
