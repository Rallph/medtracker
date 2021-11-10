# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nurses = [
  {:full_name => "Bob Rogers", :username => "bobby_R", :password => "pa$$word"},
  {:full_name => "Sally Milbert", :username => "s-milbert", :password => "PassWord"}
]
nurses.each do |nurse|
  Nurse.create!(nurse)
end

administrators = [
  {:full_name => "John Smith", :username => "johnsmith1", :password => "password1"}
]
administrators.each do |admin|
  Administrator.create!(admin)
end

students = [
  {:full_name => "Will Ries", :date_of_birth => "10-01-2009", :emergency_number_contact => "555-543-8888", :school => 3},
  {:full_name => "Jessica Klien", :date_of_birth => "04-10-2009", :emergency_number_contact => "555-543-4322", :school => 3},
  {:full_name => "Samantha Gates", :date_of_birth => "02-11-2010", :emergency_number_contact => "555-555-4211", :school => 2}
]
students.each do |student|
  Student.create!(student)
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

medication_transactions = [
  {:date => "11-09-2021", :time => "10:00AM", :change_in_quantity => "1", :medication_id => 1, :student_id => 1, :nurse_id => 2},
  {:date => "11-09-2021", :time => "10:45AM", :change_in_quantity => "10", :medication_id => 3, :student_id => 2, :nurse_id => 2},
]
medication_transactions.each do |mt|
  MedicationTransaction.create!(mt)
end

consent_forms = [
  {:date => "09-22-2021", :parent_id => 1, :student_id => 1}
]
consent_forms.each do |cf|
  ConsentForm.create!(cf)
end