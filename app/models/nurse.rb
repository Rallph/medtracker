class Nurse < ActiveRecord::Base
  belongs_to :school
  has_many :medication_transactions
end
