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

When /^student "(.*?)" has been approved for the following student medications: "(.*?)"$/ do |student_id,approved_student_medications|
  approved_student_medications.split(',').each do |asm|
    MedicationApproval.create({:student_or_school => 'student', :student_medication_id => asm, :student_id => student_id})
  end
end


When /^student "(.*?)" has been approved for the following school medications: "(.*?)"$/ do |student_id,approved_school_medications|
  approved_school_medications.split(',').each do |asm|
    MedicationApproval.create({:student_or_school => 'school', :school_medication_id => asm, :student_id => student_id})
  end
end

Then /^I should see "(.*?)" in the page title$/ do |student_name|

  result = false
  headers = all("h2")
  if headers[0].text.include? student_name
    result = true
  end

  expect(result).to be_truthy
end

Then /^I should see "(.*?)" approved in the student medication table$/ do |approved_medications|

  result = true
  table_elements = all("td")

  temp = []
  approved_medications.split(',').each do |am|
    in_table = false
    table_elements.each do |td|
      temp.append [am, td[:id]]

      if am.eql? td.text and td[:id].eql? 'approved_student_med'
        in_table = true
      end
    end
    if not in_table
      result = false
    end
  end

  expect(result).to be_truthy

end


Then /^I should see "(.*?)" approved in the school medication table$/ do |approved_medications|

  result = true
  table_elements = all("td")

  temp = []
  approved_medications.split(',').each do |am|
    in_table = false
    table_elements.each do |td|
      temp.append [am, td[:id]]

      if am.eql? td.text and td[:id].eql? 'approved_school_med'
        in_table = true
      end
    end
    if not in_table
      result = false
    end
  end

  expect(result).to be_truthy

end


# Then /^I should see "(.*?)" non-approved in the school medication table$/ do |approved_medications|
#
#   result = true
#   table_elements = all("td")
#
#   temp = []
#   approved_medications.split(',').each do |am|
#     in_table = false
#     table_elements.each do |td|
#       temp.append [am, td[:id]]
#
#
#       if am.eql? td.text and td[:id].eql? 'approved_school_med'
#         in_table = true
#       end
#     end
#     if not in_table
#       result = false
#     end
#   end
#
#   # expect(temp).to be_falsey
#   expect(result).to be_truthy
#
# end