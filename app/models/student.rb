class Student < ActiveRecord::Base
  has_many :student_medications
  has_many :student_medication_transactions
  has_many :school_medication_transactions
  has_many :medication_approvals
  has_many :emergency_contacts
  belongs_to :school
  has_and_belongs_to_many :parents
end
