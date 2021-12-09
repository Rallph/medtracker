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



#
# administrators = [
#   {:full_name => "John Smith", :username => "johnsmith1", :password => "password1", :email => "jsmith@gmail.com"}
# ]
# administrators.each do |admin|
#   Administrator.create!(admin)
# end
#
students = [
  {:full_name => "Will Ries", :date_of_birth => "10-01-2009", :school_id => 1},
  {:full_name => "Jessica Klien", :date_of_birth => "04-10-2009", :school_id => 1},
  {:full_name => "Samantha Gates", :date_of_birth => "02-11-2010", :school_id => 1}
]
students.each do |student|
  Student.create!(student)
end


districts  = [
  {:district_name => "Western Dubuque School District"},
  {:district_name => "Iowa City School District"}
]
districts.each do |district|
  District.create!(district)
end

schools = [
  {:school_name => "Beckman High School", :district_id => 1},
  {:school_name => "West Liberty High School", :district_id => 2},
  {:school_name => "Iowa City West High School", :district_id => 2},
  {:school_name => "Jefferson Elementary School", :district_id => 2}
]
schools.each do |school|
  School.create!(school)
end

school_medications = [
  {:medication_name => "Ibuprofen", :quantity => 30, :unit => "tablets", :school_id => 1},
  {:medication_name => "Tylenol", :quantity => 25, :unit => "tablets", :school_id => 2},
  {:medication_name => "Cough Syrup", :quantity => 250, :unit => "mL", :school_id => 1}
]
school_medications.each do |sm|
  SchoolMedication.create!(sm)
end

school_medication_transactions = [
  {:date => "11-09-2021", :time => "10:00AM", :change_in_quantity => "1", :school_medication_id => 1, :student_id => 1, :nurse_id => 2},
  {:date => "11-09-2021", :time => "10:45AM", :change_in_quantity => "10", :school_medication_id => 3, :student_id => 2, :nurse_id => 2},
]
school_medication_transactions.each do |mt|
  SchoolMedicationTransaction.create!(mt)
end


student_medications = [
  {:medication_name => "testmed1", :quantity => 30, :unit => "tablets", :school_id => 1, :student_id => 1},
  {:medication_name => "testmed2", :quantity => 25, :unit => "tablets", :school_id => 1, :student_id => 1},
  {:medication_name => "testmed3", :quantity => 40, :unit => "tablets", :school_id => 1, :student_id => 1},
  {:medication_name => "testmed4", :quantity => 30, :unit => "tablets", :school_id => 1, :student_id => 2},
  {:medication_name => "testmed5", :quantity => 25, :unit => "tablets", :school_id => 1, :student_id => 2},
  {:medication_name => "testmed6", :quantity => 40, :unit => "tablets", :school_id => 1, :student_id => 3},
]
student_medications.each do |sm|
  StudentMedication.create!(sm)
end

medication_approvals = [
  {:student_or_school => 'student', :student_medication_id => 1, :student_id => 1},
  {:student_or_school => 'student', :student_medication_id => 2, :student_id => 1},
  {:student_or_school => 'school', :school_medication_id => 1, :student_id => 1},
  {:student_or_school => 'school', :school_medication_id => 2, :student_id => 1}
]
medication_approvals.each do |ma|
  MedicationApproval.create!(ma)
end


# approved_student_meds = [
#   {:student_id => 1, :student_medication_id => 1},
#   {:student_id => 1, :student_medication_id => 1},
# ]
# approved_student_meds.each do |asm|
#   StudentMedicationsStudents.create!(asm)
# end
# consent_forms = [
#   {:date => "09-22-2021", :parent_id => 1, :student_id => 1}
# ]
# consent_forms.each do |cf|
#   ConsentForm.create!(cf)
# end
#
# parents = [
#   {:full_name => "Sally Ries", :email => "sries@gmail.com"},
#   {:full_name => "Kelly Klien", :email => "kklien@gmail.com"},
#   {:full_name => "Bob Gates", :email => "bgates@gmail.com"}
# ]
# parents.each do |parent|
#   Parent.create!(parent)
# end