# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Roadwork.delete_all
rw_data = JSON.parse(File.read('db/roadworks.json'))
rw_data.each do |record|
  Roadwork.create(description: record["Description"], startdate: record["StartDate"],enddate: record["EndDate"], latitude: record["Latitude"], longitude: record["Longitude"], tags: record["Tags"], submitteddate: record["SubmittedDate"])
end
