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

end
