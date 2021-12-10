Given /the following parents have been added to MedTracker:/ do |parent_table|
  parent_table.hashes.each do |parent|
    Parent.create(parent)
  end
end

Given /the following students have been added to MedTracker:/ do |student_table|
  student_table.hashes.each do |student|
    Student.create(student)
  end
end

Given /the following school medications have been added to inventory:/ do |school_medication_table|
  school_medication_table.hashes.each do |school_medication|
    SchoolMedication.create(school_medication)
  end
end

Given /the following student medications have been added to inventory:/ do |student_medication_table|
  student_medication_table.hashes.each do |student_medication|
    StudentMedication.create(student_medication)
  end
end

When /I visit the consent form page/ do
  visit "/parent/consent_form"
end

When /^I should see "(.*?)" as the page title$/ do |user_type|
  #pending # Write code here that turns the phrase above into concrete actions
  expect(false).to be_truthy
  # visit "/#{user_type}/inventory"
end