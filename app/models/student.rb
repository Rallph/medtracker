class Student < ActiveRecord::Base
  has_one :consent_form
  has_many :student_medications
  has_many :student_medication_transactions
  has_many :school_medication_transactions
  has_many :emergency_contacts
  belongs_to :school
  has_and_belongs_to_many :parents
end
