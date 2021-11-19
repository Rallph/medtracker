class NurseController < ApplicationController

  before_action :authenticate_nurse!

  def homepage
  end

  def administer
    @student_options = Student.where("school_id = :school_id", { school_id: current_nurse.school_id }).map { |student| [student.full_name, student.id] }
    @school_medication_options = SchoolMedication.where("school_id = :school_id", { school_id: current_nurse.school_id }).map { |school_medication| [school_medication.medication_name, school_medication.id] }
  end
end
