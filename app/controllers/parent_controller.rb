class ParentController < ApplicationController
  def homepage

  end


  def consent_form
    @student_id = 1
    # @
    @school_medications = StudentMedication.where()
  end


end
