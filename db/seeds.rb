require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nurses = [
  {:full_name => "Bob Rogers", :password => "Password123", :email => "brogers@gmail.com", :school_id => 1},
  {:full_name => "Sally Milbert", :password => "Password123", :email => "smilbert@gmail.com", :school_id => 1},
  {:full_name => "Betty Hawkeye", :password => "Password123", :email => "bethawks@gmail.com", :school_id => 2},
  {:full_name => "Justice Conrad", :password => "Password123", :email => "justicecon@gmail.com", :school_id => 2},
  {:full_name => "Stacy Streif", :password => "Password123", :email => "sstrief@gmail.com", :school_id => 3},
  {:full_name => "Harrison Fairfield", :password => "Password123", :email => "harryfairy@gmail.com", :school_id => 3},
  {:full_name => "Jack Davenport", :password => "Password123", :email => "jackyd@gmail.com", :school_id => 4},
  {:full_name => "Abby Hein", :password => "Password123", :email => "hein-abby@gmail.com", :school_id => 4}
]
nurses.each do |nurse|
  Nurse.create!(nurse)
end

# One administrator per school
administrators = [{:email => "jbronx@gmail.com", :password => "Password123",:full_name => "Jerry Bronx", :school_id => 1},          #, :account_approved => true},
                  {:email => "gomez-stream@gmail.com", :password => "Password123",:full_name => "Gomez Stream", :school_id => 2},     #, :account_approved => true},
                  {:email => "meggabriel@gmail.com", :password => "Password123",:full_name => "Megan Gabrielson", :school_id => 3},  #, :account_approved => true},
                  {:email => "dannyamato@gmail.com", :password => "Password123",:full_name => "Daniel Amato", :school_id => 4}]      #, :account_approved =>true}]

administrators.each do |admin|
  Administrator.create!(admin)
end
=begin
students = [
  {:full_name => "Will Ries", :date_of_birth => "10-01-2009", :school_id => 1},
  {:full_name => "Jessica Klien", :date_of_birth => "6/11/2008", :school_id => 1},
  {:full_name => "Samantha Gates", :date_of_birth => "02-11-2010", :school_id => 1}
]
students.each do |student|
  Student.create!(student)
end
=end

students_text = File.read(Rails.root.join('db','seeds_csv','students.csv'))
students_enumerable = CSV.parse(students_text, :headers => true)
students_enumerable.each do |row|
  #puts(row[0])
  Student.create!( {:full_name => row[0],
                    :date_of_birth => row["date_of_birth"],
                    :school_id => row["school_id"]})
end



districts  = [
  {:district_name => "Des Moines Public Schools School District"},
  {:district_name => "Iowa City Community School District"}
]
districts.each do |district|
  District.create!(district)
end

schools = [
  {:school_name => "Capitol View Elementary School", :district_id => 1},
  {:school_name => "Harding Middle School", :district_id => 1},
  {:school_name => "Iowa City West High School", :district_id => 2},
  {:school_name => "Van Allen Elementary School", :district_id => 2}
]
schools.each do |school|
  School.create!(school)
end

school_medications = [
  {:medication_name => "Ibuprofen Extra Strength", :quantity => 30, :unit => "tablets", :school_id => 1},
  {:medication_name => "Ibuprofen", :quantity => 300, :unit => "mL", :school_id => 2},
  {:medication_name => "Cough Syrup", :quantity => 250, :unit => "mL", :school_id => 1}
]
school_medications.each do |sm|
  SchoolMedication.create!(sm)
end
school_meds_text = File.read(Rails.root.join('db','seeds_csv','school_medications.csv'))
school_meds_enumerable = CSV.parse(school_meds_text, :headers => true)
school_meds_enumerable.each do |row|
  #puts(row[0])
  SchoolMedication.create!({:medication_name => row[0],
                            :quantity => row["quantity"],
                            :unit => row["unit"],
                            :school_id => row["school_id"]})
end

# School Medication Seeding from csv
student_meds_text = File.read(Rails.root.join('db','seeds_csv','student_medications.csv'))
student_meds_enumerable = CSV.parse(student_meds_text, :headers => true)
student_meds_enumerable.each do |row|
  #puts(row[0])
  StudentMedication.create!({:medication_name => row[0],
                             :quantity => row["quantity"],
                             :unit => row["unit"],
                             :school_id => row["school_id"],
                             :student_id => row["student_id"]})
end

school_medication_transactions = [
  {:date => "11-09-2021", :time => "10:00AM", :change_in_quantity => "1", :school_medication_id => 1, :student_id => 1, :nurse_id => 2},
  {:date => "11-09-2021", :time => "10:45AM", :change_in_quantity => "10", :school_medication_id => 3, :student_id => 2, :nurse_id => 2},
]
school_medication_transactions.each do |mt|
  SchoolMedicationTransaction.create!(mt)
end

# consent_forms = [
#   {:date => "09-22-2021", :parent_id => 1, :student_id => 1}
# ]
# consent_forms.each do |cf|
#   ConsentForm.create!(cf)
# end
#
#
=begin
parents = [
 {:full_name => "Sally Ries", :email => "sries@gmail.com", :password => "Password123"},
 {:full_name => "Kelly Klien", :email => "kklien@gmail.com", :password => "Password123"},
 {:full_name => "Bob Gates", :email => "bgates@gmail.com", :password => "Password123"}]

parents.each do |parent|
  Parent.create!(parent)
end
=end

parents_text = File.read(Rails.root.join('db','seeds_csv','parents.csv'))
parents_enumerable = CSV.parse(parents_text, :headers => true)
parents_enumerable.each do |row|
  #puts(row[0])
  Parent.create!( {:email => row[0],
                    :full_name => row["full_name"],
                    :password => row["password"]})
end


Parent.count.times do |i|
  parent = Parent.find(i + 1)
  student = Student.find(i + 1)
  parent.students << student
end
