class NurseController < ApplicationController

  before_action :authenticate_nurse!

  def homepage
  end

  def administer
    @student_options = Student.where("school_id = :school_id", { school_id: current_nurse.school_id }).map { |student| [student.full_name, student.id] }
    @school_medication_options = SchoolMedication.where("school_id = :school_id", { school_id: current_nurse.school_id }).map { |school_medication| [school_medication.medication_name, school_medication.id] }
  end

  def administer_submit
    param! :select_student,     Integer, required: true, message: "Student not specified"
    param! :select_medication,  Integer, required: true, message: "Medication not specified"
    param! :dosage,             Integer, required: true, min: 1, message: "At least one dose must be administered"
    param! :time,               String, required: true, message: "Administration time not specified"
    param! :comment,            String

    datetime = params[:time].split("T")
    date = datetime[0]
    time = datetime[1]

    SchoolMedicationTransaction.create!(student_id: params[:select_student], nurse_id: current_nurse.id, school_medication_id: params[:select_medication], change_in_quantity: params[:dosage], date: date, time: time, comment: params[:comment])

    flash[:info] = "Medication administered successfully"
    redirect_to :administer
  end

end
