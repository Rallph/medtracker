class SchoolMedication < ActiveRecord::Base
  belongs_to :school
  has_many :school_medication_transactions
  has_many :medication_approvals

end
