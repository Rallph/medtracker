Given /^I am on the Add Medication page$/ do
  visit '/nurse/add_medication' #:add_medication
end

When /^The student box is checked$/ do
  check "belongs_to_student"
  find('#belongs_to_student').trigger('change')

end


When /^I enter a school medication as name: "(.*?)", unit: "(.*?)", initial amount: "(.*?)"$/ do |name, unit, initial_amount|
  fill_in 'name_of_medication', with: name
  fill_in 'unit_of_measurement', with: unit
  fill_in 'initial_amount', with: initial_amount
  click_button 'Add Medication'

end


When /^I enter a student medication as name: "(.*?)", unit: "(.*?)", initial amount: "(.*?)", student id: "(.*?)"$/ do |name, unit, initial_amount, student_id|
  fill_in 'name_of_medication', with: name
  fill_in 'unit_of_measurement', with: unit
  fill_in 'initial_amount', with: initial_amount
  fill_in 'student_id', with: student_id
  click_button 'Add Medication'

end