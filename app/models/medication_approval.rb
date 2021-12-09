class MedicationApproval < ActiveRecord::Base
  belongs_to :student
  belongs_to :student_medication
  belongs_to :school_medication
end
