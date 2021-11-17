class Parent < ActiveRecord::Base
  has_many :consent_forms
  has_and_belongs_to_many :students
end
