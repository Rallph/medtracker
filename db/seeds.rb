require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# nurses = [
#   {:full_name => "Bob Rogers", :password => "pa$$word", :email => "brogers@gmail.com", :school_id => 1},
#   {:full_name => "Sally Milbert", :password => "PassWord", :email => "smilbert@gmail.com", :school_id => 1}
# ]
# nurses.each do |nurse|
#   Nurse.create!(nurse)
# end


nurses = [
  {:full_name => "Bob Rogers", :password => "Password123", :email => "brogers@gmail.com", :school_id => 1, :account_approved => true},
  {:full_name => "Sally Milbert", :password => "Password123", :email => "smilbert@gmail.com", :school_id => 1, :account_approved => true},
  {:full_name => "Betty Hawkeye", :password => "Password123", :email => "bethawks@gmail.com", :school_id => 2, :account_approved => true},
  {:full_name => "Justice Conrad", :password => "Password123", :email => "justicecon@gmail.com", :school_id => 2, :account_approved => true},
  {:full_name => "Stacy Streif", :password => "Password123", :email => "sstrief@gmail.com", :school_id => 3, :account_approved => true},
  {:full_name => "Harrison Fairfield", :password => "Password123", :email => "harryfairy@gmail.com", :school_id => 3, :account_approved => true},
  {:full_name => "Jack Davenport", :password => "Password123", :email => "jackyd@gmail.com", :school_id => 4, :account_approved => true},
  {:full_name => "Abby Hein", :password => "Password123", :email => "hein-abby@gmail.com", :school_id => 4, :account_approved => false}

]
nurses.each do |nurse|
  Nurse.create!(nurse)
end

# One administrator per school
administrators = [{:email => "jbronx@gmail.com", :password => "Password123",:full_name => "Jerry Bronx", :school_id => 1, :account_approved => true},
                  {:email => "gomez-stream@gmail.com", :password => "Password123",:full_name => "Gomez Stream", :school_id => 2, :account_approved => true},
                  {:email => "meggabriel@gmail.com", :password => "Password123",:full_name => "Megan Gabrielson", :school_id => 3, :account_approved => true},
                  {:email => "dannyamato@gmail.com", :password => "Password123",:full_name => "Daniel Amato", :school_id => 4, :account_approved =>true}]

administrators.each do |admin|
  Administrator.create!(admin)

end


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

# Seeding for SchoolMedicationTransaction. Done from csv file.
school_med_transactions_text = File.read(Rails.root.join('db','seeds_csv','school_medication_transactions.csv'))
school_med_transactions_enumerable = CSV.parse(school_med_transactions_text, :headers => true)
school_med_transactions_enumerable.each do |row|
  SchoolMedicationTransaction.create!({:date => row[0],
                                       :time => row["time"],
                                       :change_in_quantity => row["change_in_quantity"],
                                       :school_medication_id => row["school_medication_id"],
                                       :student_id => row["student_id"],
                                       :nurse_id => row["nurse_id"]})
end

#Seeding for StudentMedicationTransaction. Done from csv file.
student_med_transactions_text = File.read(Rails.root.join('db','seeds_csv','student_medication_transactions.csv'))
student_med_transactions_enumerable = CSV.parse(student_med_transactions_text, :headers => true)
student_med_transactions_enumerable.each do |row|
  StudentMedicationTransaction.create!({:date => row[0],
                                       :time => row["time"],
                                       :change_in_quantity => row["change_in_quantity"],
                                       :student_medication_id => row["student_medication_id"],
                                       :nurse_id => row["nurse_id"]})
end

#Seeding for Parents. Done from csv file.
parents_text = File.read(Rails.root.join('db','seeds_csv','parents.csv'))
parents_enumerable = CSV.parse(parents_text, :headers => true)
parents_enumerable.each do |row|
  #puts(row[0])
  Parent.create!( {:email => row[0],
                    :full_name => row["full_name"],
                    :password => row["password"]})
end

#Create has_and_belongs_to_many relationship. Done from csv file. The csv files are set up in a manner the first
# row of parents belongs to the first row of students. This is so that last names can match up properly.
# Because of this, be cautious while changing any seeding for students or parents.
Parent.count.times do |i|
  parent = Parent.find(i + 1)
  student = Student.find(i + 1)
  parent.students << student
end

#Create medication_approvals table from existing medication transactions
#
# SCHOOL MEDICATION APPROVALS
# NOTE: the csv file for school medication transactions is set up such that there are no duplicate students taking
# the same medication twice. If that were to happen, this method of seeding would create duplicates.
# To counter act this we could check if the pending medication approal already exists in the DB, and if it does we
# skip the creation of that approval.
SchoolMedicationTransaction.count.times do |i|
  school_med = SchoolMedicationTransaction.find(i + 1)
  student_or_school = 'school'

  MedicationApproval.create!({:student_or_school => student_or_school,
                              :school_medication_id => school_med[:school_medication_id],
                              :student_id => school_med[:student_id]})
end
# Create medication approvals for student medication. Using StudentMedication model since it already contains
# All the req. info needed.
StudentMedication.count.times do |i|
  student_med = StudentMedication.find(i + 1)
  student_or_school = 'student'

  MedicationApproval.create!({:student_or_school => student_or_school,
                              :student_medication_id => i,
                              :student_id => student_med[:student_id]})
end
