class StudentMedication < ActiveRecord::Base
  belongs_to :student
  has_many :student_medication_transactions
  has_and_belongs_to_many :consent_forms
  has_many :medication_approvals
end
