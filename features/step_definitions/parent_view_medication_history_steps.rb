Given /the following "(.*?)" medications have been administered:/ do |medicine_type, medicine_table|

  medicine_table.hashes.each do |medicine_administration|
    if medicine_type == "student"
      StudentMedicationTransaction.create!(medicine_administration)
    else
      SchoolMedicationTransaction.create!(medicine_administration)
    end
  end

end

When /I am on the parent view medication history page/ do
  visit("medication_history?student_id=1")
end

Then /I should see medication history for "(.*?)"/ do |medications|

  administered_medications = medications.split(",")

  administered_medications.each do |medication|
    page.should have_content(medication)
  end

end