Given /the following "(.*?)" have been added to inventory:/ do |medication_type, medications_table|

  medications_table.hashes.each do |medication|

    if (medication_type == "school_medications")
      SchoolMedication.create(medication)
    elsif (medication_type == "student_medications")
      StudentMedication.create(medication)
    end
  end
end

Given /the following students have been added to MedMonitor:/ do |students_table|
  students_table.hashes.each do |student|
    Student.create(student)
  end
end

Given /the school with name: "(.*?)" and district_id: "(.*?)" has been added to MedMonitor:/ do |school_name, district_id|
  School.create(:school_name =>school_name, :district_id => district_id)
end



When /^I view "(.*?)" medication inventory$/ do |user_type|
  #pending # Write code here that turns the phrase above into concrete actions
  visit "/#{user_type}/inventory"
end

When /^I view parent medication inventory$/ do
  #pending # Write code here that turns the phrase above into concrete actions
  visit "/parent/parent_inventory"
end

Then /^I should only see medications belonging to school_name: "(.*?)"$/ do |school_id|

  all('#inventory tr > td:nth-child(5)').each do |td|
    #puts(td.text)
    "#{school_id}".should include td.text
    end
end

Then /^I should only see medications belonging to student_name: "(.*?)"$/ do |student_ids|
  array = student_ids.split(',')
  all('#student_inventory tr > td:nth-child(6)').each do |td|
    array.should include td.text
  end
end

And /the following schools have been added to MedMonitor:/ do |schools_table|
  schools_table.hashes.each do |school|
    School.create(school)
  end
end

Given /the following districts have been added to MedMonitor:/ do |district_table|
  district_table.hashes.each do |district|
    District.create(district)
  end
end