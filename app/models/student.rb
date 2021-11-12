class Student < ActiveRecord::Base
  has_many :consent_forms
  has_many :student_medications
  has_many :medication_transactions
  has_many :emergency_contacts
  belongs_to :school
end
