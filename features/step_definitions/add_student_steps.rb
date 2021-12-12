Given /^I am on the Add Student page$/ do
  visit '/administrator/add_student'
end

When /^I enter a student as name: "(.*?)", date_of_birth: "(.*?)", parent_email: "(.*?)"$/ do |name, date_of_birth, parent_email|
  fill_in 'student_name', with: name
  fill_in 'date_of_birth', with: date_of_birth
  fill_in 'parent_email', with: parent_email
  click_button 'Add Student'

end


When /^I enter a student as name: "(.*?)", school_id: "(.*?)", date_of_birth: "(.*?)", parent_email: "(.*?)"$/ do |name, school_id, date_of_birth, parent_email|
  fill_in 'student_name', with: name
  fill_in 'school_id', with: school_id
  fill_in 'date_of_birth', with: date_of_birth
  fill_in 'parent_email', with: parent_email
  click_button 'Add Student'

end