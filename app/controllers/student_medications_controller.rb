class StudentMedicationsController < ApplicationController
  before_action :authenticate_nurse!

  def get_medications_for_student
    student_id = params[:student_id]
    @medications_for_student = StudentMedication.where("student_id = :student_id", { student_id: student_id })

    render json: @medications_for_student
  end

end