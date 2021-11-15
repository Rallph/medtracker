class StudentMedicationTransaction < ActiveRecord::Base
  belongs_to :nurse
  belongs_to :student_medication
end
