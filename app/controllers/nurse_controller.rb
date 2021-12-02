class NurseController < ApplicationController

  before_action :authenticate_nurse!

  def homepage
  end

  def inventory
    @school_medications = SchoolMedication.where('school_id = :nurse_school',:nurse_school => current_nurse[:school_id])
    if @school_medications.empty?
      flash[:alert] = "Inventory is Empty."
    end
  end
end
