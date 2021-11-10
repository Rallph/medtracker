# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

administrators = [
  {:full_name => "John Smith", :username => "johnsmith1", :password => "password1"}
]
administrators.each do |admin|
  Administrator.create!(admin)
end

nurses = [
  {:full_name => "Bob Rogers", :username => "bobby_R", :password => "pa$$word"},
  {:full_name => "Sally Milbert", :username => "s-milbert", :password => "PassWord"}
]
nurses.each do |nurse|
  Nurse.create!(nurse)
end


schools = [
  {:school_name => "Beckman High School"},
  {:school_name => "West Liberty High School"},
  {:school_name => "Iowa City West High School"},
  {:school_name => "Jefferson Elementary School"}
]
schools.each do |school|
  School.create!(school)
end

school_medications = [
  {:medication_name => "Ibuprofen", :quantity => 30, :unit => "tablets", :school_id => 1},
  {:medication_name => "Ibuprofen", :quantity => 25, :unit => "tablets", :school_id => 2},
  {:medication_name => "Cough Syrup", :quantity => 250, :unit => "mL", :school_id => 1}
]
school_medications.each do |sm|
  SchoolMedication.create!(sm)
end