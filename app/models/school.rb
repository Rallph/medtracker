class School < ActiveRecord::Base
  has_many :school_medications
  has_many :students
  has_many :nurses
  has_many :administrators
end
