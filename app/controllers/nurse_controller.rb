class NurseController < ApplicationController

  before_action :verify_nurse

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
    param! :select_student,     Integer, required: true, message: "Student not specified"
    # TODO change this to check if at least one is present
    param! :select_school_medication,  String
    param! :select_student_medication,  String
    param! :dosage,             Integer, required: true, min: 1, message: "At least one dose must be administered"
    param! :time,               String, required: true, message: "Administration time not specified"
    param! :comment,            String

    school_medication = params[:select_school_medication]
    student_medication = params[:select_student_medication]

    datetime = params[:time].split("T")
    date = datetime[0]
    time = datetime[1]

    #TODO add actual validation to ensure only one type of medication is submitted
    if student_medication && !student_medication.empty?
      StudentMedicationTransaction.create!(nurse_id: current_nurse.id, student_medication_id: student_medication, change_in_quantity: params[:dosage], date: date, time: time, comment: params[:comment])
                                  .decrease_medication_quantity
    else
      SchoolMedicationTransaction.create!(student_id: params[:select_student], nurse_id: current_nurse.id, school_medication_id: school_medication, change_in_quantity: params[:dosage], date: date, time: time, comment: params[:comment])
                                 .decrease_medication_quantity
    end

    flash[:info] = "Medication administered successfully"
    redirect_to :administer
  end


  def add_medication
  end

  def add_medication_submit

    med_name = params[:name_of_medication]
    initial_amount = params[:initial_amount]
    med_unit = params[:unit_of_measurement]

    if med_name.eql? ''
      flash[:info] = "Medication not added. Name of medication was not specified."
    elsif med_unit.eql? ''
      flash[:info] = "Medication not added. Unit of medication was not specified."
    elsif initial_amount.eql? ''
      flash[:info] = "Medication not added. Initial amount of medication was not specified."
    elsif initial_amount.to_i.to_s != initial_amount
      flash[:info] = "Medication not added. Initial amount of medication has to be a number (1,2,3,...)."
    else

      if defined? params[:belongs_to_student] and params[:belongs_to_student].eql? "on"

        student_id = params[:student_id]

        if student_id.eql? ''
          flash[:info] = "Medication not added. Student box was checked, but Student ID was not specified."
        elsif student_id.to_i.to_s != student_id
          flash[:info] = "Medication not added. Student box was checked, but Student ID was not a number (1,2,3,...)."
        else
          StudentMedication.create!(
            medication_name: med_name,
            quantity: initial_amount,
            unit: med_unit,
            school_id: 1,
            student_id: student_id
          )
          flash[:info] = "Student Medication added successfully"
        end

      else
        SchoolMedication.create!(
          medication_name: med_name,
          quantity: initial_amount,
          unit: med_unit,
          school_id: 1
        )

        flash[:info] = "Medication added successfully"
      end
    end
    redirect_to :add_medication
  end

  def inventory
    @schools = School.find(current_nurse.school_id)
    @school_medications = SchoolMedication.where('school_id = :nurse_school',:nurse_school => current_nurse.school_id)
    @student_medications = StudentMedication.where('school_id = :nurse_school', :nurse_school => current_nurse.school_id)
    if @school_medications.empty? or @student_medications.empty?
      flash[:alert] = "Inventory is Empty."
    end
  end
end
