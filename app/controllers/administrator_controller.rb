class AdministratorController < ApplicationController

  before_action :authenticate_administrator!

  def homepage

    # get list of all nurses who's accounts have not yet been approved.
    @unapproved_nurses = Nurse.where('account_approved = :approval_status AND school_id = :id', {approval_status: false, id: current_administrator.school_id})

  end

  def add_student

  end

  def submit_new_student
    emerg_contact = params["emerg_contact"]

    #Student.create!

    flash[:info] = "Student info added successfully"
    redirect_to :add_student
  end

end
