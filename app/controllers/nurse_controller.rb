class NurseController < ApplicationController

  before_action :authenticate_nurse!

  def homepage
  end

  def inventory
    @schools = School.find(current_nurse[:school_id])
    @school_medications = SchoolMedication.where('school_id = :nurse_school',:nurse_school => current_nurse[:school_id])
    @student_medications = StudentMedication.where('school_id = :nurse_school', :nurse_school => current_nurse[:school_id])
    if @school_medications.empty? or @student_medications.empty?
      flash[:alert] = "Inventory is Empty."
    end
  end
end
