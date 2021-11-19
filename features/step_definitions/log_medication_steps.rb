Given /the following Students have been added to MedMonitor:/ do |students_table|
  students_table.hashes.each do |student|

    Student.create!(student)
  end
end

Given /^I am on the Administer Medication page$/ do
  visit :administer
end

Then /^I should see fields for "(.*?)"$/ do |fields|

  # split strings by comma, replace spaces with dashes to be formatted as HTML IDs
  field_ids = fields.split(',').map { |field_str| field_str.gsub(" ", "-") }

  # check that the page has elements with those IDs
  field_ids.each do |field_id|
    page.has_field?(field_id)
  end

end