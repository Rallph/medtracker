class MedicationTransaction < ActiveRecord::Base
  belongs_to :school_medication
  belongs_to :student
  belongs_to :nurse
end
