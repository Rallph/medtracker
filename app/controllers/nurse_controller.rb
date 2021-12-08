class NurseController < ApplicationController

  before_action :authenticate_nurse!

  def homepage

    # query DB for any medicines which are low in inventory
    @meds_in_low_supply = SchoolMedication.where("((unit = 'mL' AND quantity <= :mL_alert_quantity) OR (unit = 'tablets' AND quantity <= :tablet_alert_quantity)) AND (school_id = :nurse_school_id)",
                                                 {mL_alert_quantity: 250, tablet_alert_quantity: 50, nurse_school_id: (current_nurse).school_id})

    # consider adding functionality that alerts the nurse when specific students are running low on medicine

  end

  def administer
    @student_options = Student.where("school_id = :school_id", { school_id: current_nurse.school_id })
    @school_medication_options = SchoolMedication.where("school_id = :school_id", { school_id: current_nurse.school_id })
  end

  def administer_submit

    school_medication = params[:select_school_medication]
    student_medication = params[:select_student_medication]

    datetime = params[:time].split("T")
    date = datetime[0]
    time = datetime[1]

    #TODO add actual validation to ensure only one type of medication is submitted
    if student_medication && !student_medication.empty?
      StudentMedicationTransaction.create!(nurse_id: current_nurse.id, student_medication_id: student_medication, change_in_quantity: params[:dosage], date: date, time: time, comment: params[:comment])
    else
      SchoolMedicationTransaction.create!(student_id: params[:select_student], nurse_id: current_nurse.id, school_medication_id: school_medication, change_in_quantity: params[:dosage], date: date, time: time, comment: params[:comment])
    end

    flash[:info] = "Medication administered successfully"
    redirect_to :administer
  end

end
