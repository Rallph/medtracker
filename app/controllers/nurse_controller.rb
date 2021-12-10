class NurseController < ApplicationController

  before_action :authenticate_nurse!

  def homepage
    # query DB for any medicines which are low in inventory
    @meds_in_low_supply = SchoolMedication.where("((unit = 'mL' AND quantity <= :mL_alert_quantity) OR (unit = 'tablets' AND quantity <= :tablet_alert_quantity)) AND (school_id = :nurse_school_id)",
                                                 {mL_alert_quantity: 250, tablet_alert_quantity: 50, nurse_school_id: (current_nurse).school_id})

    # consider adding functionality that alerts the nurse when specific students are running low on medicine

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
