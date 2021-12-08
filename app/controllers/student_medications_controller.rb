class StudentMedicationsController < ApplicationController
  before_action :authenticate_nurse!

  def get_medications_for_student
    student_id = params[:student_id]
    @medications_for_student = StudentMedication.where("student_id = :student_id", { student_id: student_id })

    respond_to do |format|
      format.json { render json: @medications_for_student }
      format.html { redirect_to :nurse_root } # this is intended to be accessed via javascript, so redirect to nurse homepage otherwise
    end

  end

end