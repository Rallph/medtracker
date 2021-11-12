class StudentMedicationTransaction < ActiveRecord::Base
  has_one :nurse
  has_one :student_medication
end
