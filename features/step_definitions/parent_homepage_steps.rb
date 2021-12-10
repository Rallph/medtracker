Then /^I should see the following students: "(.*?)"$/ do |students|
  students_array = students.split(',')
  students_array.each do |student|

    page.should have_content(student)

  end
end

When /^I click the "(.*?)" button for student "(.*?) with id "(.*?)"$/ do |button, student, id|

  click_button(button + "-" + student + "-" + id)

end