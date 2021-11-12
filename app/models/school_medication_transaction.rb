class SchoolMedicationTransaction < ActiveRecord::Base
  has_one :student
  has_one :nurse
  has_one :school_medication
end
