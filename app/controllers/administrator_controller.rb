class AdministratorController < ApplicationController

  before_action :authenticate_administrator!

  def homepage
  end

  def add_student

  end

  def submit_new_student
    emerg_contact = params["emerg_contact"]

    #Student.create!

    flash[:info] = "Student info added successfully"
    redirect_to :add_student
  end

  def inventory
    @school = School.find(current_administrator.school_id)
    @school_medications = SchoolMedication.where('school_id = :administrator_school', :administrator_school => current_administrator.school_id)
    @student_medications = StudentMedication.where('school_id = :administrator_school', :administrator_school => current_administrator.school_id)
    if @school_medications.empty? or @student_medications.empty?
      flash[:alert] = "Inventory is Empty."
    end
  end

end
