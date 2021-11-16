class SchoolMedication < ActiveRecord::Base
  belongs_to :school
  has_many :school_medication_transactions
  has_and_belongs_to_many :consent_forms
end
