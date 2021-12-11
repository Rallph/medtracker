
Given /the following "(.*?)" have been added to inventory:/ do |medication_type, medications_table|

  medications_table.hashes.each do |medication|

    if (medication_type == "school_medications")
      #puts("school meds created")
      SchoolMedication.create(medication)
    elsif (medication_type == "student_medications")
      StudentMedication.create(medication)
    end
  end
end

And /the following Parent Student relationships exists:/ do |parents_students_table|
  parents_students_table.hashes.each do |row|
    parent = Parent.find(row["parent_id"])
    student = Student.find(row["student_id"])
    parent.students << student
  end
end

When /^I view "(.*?)" medication inventory$/ do |user_type|
  #pending # Write code here that turns the phrase above into concrete actions
  visit "/#{user_type}/inventory"
end

Then /^I should only see medications belonging to student: "(.*?)"$/ do |student_name|
  all('#inventory tr > td:nth-child(4)').each do |td|
    #puts(td.text)
    "#{student_name}".should include td.text
    #%w{school_id}.should include td.text
  end
end