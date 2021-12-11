class AdministratorController < ApplicationController

  before_action :authenticate_administrator!

  def homepage
  end

  def add_student

  end

  def submit_new_student
    student_name = params[:student_name]
    school_id = params[:school_id]
    date_of_birth = params[:date_of_birth]
    parent_email = params[:parent_email]

    if student_name.eql? ''
      flash[:info] = "Student not specified."
    elsif school_id.eql? ''
      flash[:info] = "School ID was not specified."
    elsif date_of_birth.eql? ''
      flash[:info] = "Date of Birth was not specified."
    elsif parent_email.eql? ''
      flash[:info] = "Parent email was not specified."
    else
    end

    #Student.create!

    flash[:info] = "Student info added successfully"
    redirect_to :add_student
  end

end
