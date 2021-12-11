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
    school_id = current_administrator.school_id
    @school_nurses = Nurse.where('school_id = :id', {id: school_id})
    @school_admins = Administrator.where('school_id = :id', {id: school_id})

    @approved_nurses = []
    @unapproved_nurses = []

    @approved_admins = []
    @unapproved_admins = []

    @school_nurses.each do |nurse|

      if nurse.account_approved
        @approved_nurses.append(nurse)
      else
        @unapproved_nurses.append(nurse)
      end

    end

    @school_admins.each do |admin|
      if admin.account_approved
        @approved_admins.append(admin)
      else
        @unapproved_admins.append(admin)
      end
    end

  end

  def approve_new_account

    @email = params[:email]
    @role = params[:role]

    if (@role == "Nurse")
      @nurse = Nurse.where('email = :nurse_email', {nurse_email: @email})
      @nurse.first.update(account_approved: true)
    else
      @admin = Administrator.where('email = :admin_email', {admin_email: @email})
      @admin.first.update(account_approved: true)
    end

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
