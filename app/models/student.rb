class Student < ActiveRecord::Base
  has_many :consent_forms
  has_many :student_medications
  has_many :medication_transactions
  belongs_to :school
end
