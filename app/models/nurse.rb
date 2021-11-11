class Nurse < ActiveRecord::Base
  has_secure_password
  belongs_to :school
  has_many :medication_transactions
end
