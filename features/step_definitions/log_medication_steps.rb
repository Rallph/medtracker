Given /the following Students have been added to MedMonitor:/ do |students_table|
  students_table.hashes.each do |student|

    Student.create!(student)
  end
end