Given /the following "(.*?)" medications have been administered to "(.*?)":/ do |medicine_type, student, medicine_table|

  if medicine_type == "student_medications"
    StudentMedicationTransaction.create!(medicine_table)
  else
    SchoolMedicationTransaction.create!(medicine_table)
  end

end

When /I am on the parent view medication history page/ do
  visit('/medication_history')
end