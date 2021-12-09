class AdministratorController < ApplicationController

  before_action :verify_administrator

  def homepage

    school_id = current_administrator.school_id

    # get all nurses and admins who's accounts have not yet been approved.
    @unapproved_nurses = Nurse.where('account_approved = :approval_status AND school_id = :id', {approval_status: false, id: school_id})
    @unapproved_admins = Administrator.where('account_approved = :approval_status AND school_id = :id', {approval_status: false, id: school_id})

  end

  def approve_accounts

    # get list of nurses who's accounts have not yet been approved
    @school_nurses = Nurse.where('school_id = :id', {id: current_administrator.school_id})

    @approved_nurses = []
    @unapproved_nurses = []

    @school_nurses.each do |nurse|

      if nurse.account_approved
        @approved_nurses.append(nurse)
      else
        @unapproved_nurses.append(nurse)
      end

    end

  end

  def approve_new_account

    @email = params[:email]

    @nurse = Nurse.where('email = :nurse_email', {nurse_email: @email})
    @nurse.first.update(account_approved: true)

    redirect_to :approve_accounts

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
