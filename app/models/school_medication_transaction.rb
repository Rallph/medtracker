class SchoolMedicationTransaction < ActiveRecord::Base
  belongs_to :student
  belongs_to :nurse
  belongs_to :school_medication
end
