class ParentController < ApplicationController

  before_action :authenticate_parent!

  def homepage

    @students = current_parent.students

  end

  def medication_history

    @student = Student.find(params[:student_id])

    if not @student.parents.include? current_parent
      flash[:info] = "Error: You do not have access to that page."
      redirect_to '/parent/homepage'
    end

    school_med_transactions = @student.school_medication_transactions
    student_medications = @student.student_medications

    @med_transactions = []

    school_med_transactions.each do |school_med_transaction|

      transaction = {}
      transaction["nurse"] = Nurse.find(school_med_transaction.nurse_id).full_name
      transaction["amount"] = school_med_transaction.change_in_quantity
      transaction["time"] = school_med_transaction.time
      transaction["date"] = school_med_transaction.date

      medication = SchoolMedication.find(school_med_transaction.school_medication_id)

      transaction["med_name"] = medication.medication_name
      transaction["units"] = medication.unit
      transaction["type"] = "School Medication"

      @med_transactions.append(transaction)

    end

    # No way to directly reference student medication transactions from student
    student_medications.each do |student_medication|

      student_medication.student_medication_transactions.each do |student_medication_transaction|

        transaction = {}
        transaction["nurse"] = Nurse.find(student_medication_transaction.nurse_id).full_name
        transaction["amount"] = student_medication_transaction.change_in_quantity
        transaction["time"] = student_medication_transaction.time
        transaction["date"] = student_medication_transaction.date

        transaction["med_name"] = student_medication.medication_name
        transaction["units"] = student_medication.unit
        transaction["type"] = "Student Medication"

        @med_transactions.append(transaction)


      end

    end


  end

  def parent_inventory
    #Verify the parent has an assigned student
    if current_parent.students.first.nil?
      redirect_to :parent_root
      flash[:alert] = "Could not find a student belonging to you. Please contact the school."

    else
      # Get the students that belong to the currently signed in parent
      @students = current_parent.students
      @student_medications = []
      @students.each do |student|
        @student_medications += StudentMedication.where('student_id = :parent_student', :parent_student => student)
      end
      # if the student has no student medications, flash that there are no meds.
      if @student_medications.empty?
        flash[:alert] = "There are no student medications in stock, if this seems wrong, please contact the school."
      end
    end

  end

  def consent_form

    # @student = params[:student_id]
    @student = Student.where('id = '+ params[:student_id])

    if not @student[0].parents.include? current_parent
      flash[:info] = "Error: You do not have access to that page."
      redirect_to '/parent/homepage'
    end

    @school_medications = SchoolMedication.all
    @approved_medication_ids = @student[0].medication_approvals
    @approved_school_meds = []
    @non_approved_school_meds = []
    @school_medications.each do |school_med|
      approved = false
      @approved_medication_ids.each do |approved_med|
        if (approved_med.student_or_school.eql? 'school') and (approved_med.school_medication_id.eql? school_med.id)
          approved = true
        end
      end
      if approved.eql? true
        @approved_school_meds.append school_med
      else
        @non_approved_school_meds.append school_med
      end
    end

    @student_medications = StudentMedication.where('student_id = 1')
    @approved_student_meds = []
    @non_approved_student_meds = []
    @student_medications.each do |student_med|
      approved = false
      @approved_medication_ids.each do |approved_med|
        if (approved_med.student_or_school.eql? 'student') and (approved_med.student_medication_id.eql? student_med.id)
          approved = true
        end
      end
      if approved.eql? true
        @approved_student_meds.append student_med
      else
        @non_approved_student_meds.append student_med
      end
    end

  end

  def approve_medication
    student_id = params['student_id']
    med_type = params['med_type']
    if med_type.eql? 'student'
      medication_id = params['st_medication_id']
      MedicationApproval.create!({:student_id => student_id, :student_or_school => med_type, :student_medication_id => medication_id})
    else
      medication_id = params['sc_medication_id']
      MedicationApproval.create!({:student_id => student_id, :student_or_school => med_type, :school_medication_id => medication_id})
    end
    redirect_to '/parent/consent_form?student_id=' + student_id
  end

  def disapprove_medication
    student_id = params['student_id']
    med_type = params['med_type']
    medication_id = params['medication_id']
    if med_type.eql? 'student'
      med_to_disapprove = MedicationApproval.where("student_id = "+student_id+" AND student_or_school = '"+med_type+"' AND student_medication_id = "+medication_id)
      med_to_disapprove[0].destroy
    else
      med_to_disapprove = MedicationApproval.where("student_id = "+student_id+" AND student_or_school = '"+med_type+"' AND school_medication_id = "+medication_id)
      med_to_disapprove[0].destroy
    end
    redirect_to '/parent/consent_form?student_id=' + student_id
  end

end
