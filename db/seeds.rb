# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

administrators = [{:full_name => "John Smith", :username => "johnsmith1", :password => "password1"}]

administrators.each do |admin|
  Administrator.create!(admin)
end
