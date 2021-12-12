class AdministratorController < ApplicationController

  before_action :authenticate_administrator!

  def homepage
  end

  def add_student

  end

  def submit_new_student
    studnt_name = params[:student_name]
    schl_id = params[:school_id]
    dob = params[:date_of_birth]
    p_email = params[:parent_email]

    if studnt_name.eql? ''
      flash[:info] = "Student not specified."
    elsif schl_id.eql? ''
      flash[:info] = "School ID was not specified."
    elsif dob.eql? ''
      flash[:info] = "Date of Birth was not specified."
    elsif p_email.eql? ''
      flash[:info] = "Parent email was not specified."
    else
      student = Student.create!(
        full_name: studnt_name,
        school_id: schl_id,
        date_of_birth: dob
      )
      @parent = Parent.where(email: p_email)
      @parent[0].students << student

      flash[:info] = "Student info added successfully"
    end
    redirect_to :add_student
  end

end
