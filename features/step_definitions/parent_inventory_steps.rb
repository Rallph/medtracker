
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

And /the following Parent Student relationship exists:/ do |parents_students_table|
  parents_students_table.hashes.each do |row|
    parent = parent.find(row["parent_id"])
    student = student.find(row["student_id"])
    parent.students << student
  end
end