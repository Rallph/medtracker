class ConsentForm < ActiveRecord::Base
  belongs_to :student
  has_and_belongs_to_many :school_medications
  has_and_belongs_to_many :student_medications
end
