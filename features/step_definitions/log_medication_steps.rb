'''Given /the following Students have been added to MedMonitor:/ do |students_table|
  students_table.hashes.each do |student|

    Student.create!(student)
  end
end'''

Given /the following school medications have been added to MedMonitor:/ do |medications_table|
  medications_table.hashes.each do |medication|
    SchoolMedication.create!(medication)
  end
end

Given /^I am on the Administer Medication page$/ do
  visit :administer
end

Then /^I should see fields for "(.*?)"$/ do |fields|

  # split strings by comma, replace spaces with dashes to be formatted as HTML IDs
  field_ids = fields.split(',').map { |field_str| field_str.gsub(" ", "_") }

  # check that the page has elements with those IDs
  field_ids.each do |field_id|
    expect(page.has_field?(field_id)).to be_truthy
  end

end

When /^I administer "([^"]*)" dose\(s\) of school medication "([^"]*)" to student "([^"]*)"$/ do |dosage, medication, student|
  select student, from: 'select_student'
  select medication, from: 'select_school_medication'
  fill_in 'dosage', with: dosage

  click_button 'Administer Medication'
end

When /John Doe has been approved to take Ibuprofen/ do

  MedicationApproval.create!({student_id: 1, school_medication_id: 1})

end
