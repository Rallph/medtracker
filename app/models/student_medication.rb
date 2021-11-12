class StudentMedication < ActiveRecord::Base
  belongs_to :student
  has_many :student_medication_transactions
end
