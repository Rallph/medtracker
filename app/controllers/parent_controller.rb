class ParentController < ApplicationController

  before_action :authenticate_parent!

  def homepage

    @students = current_parent.students

  end


  def consent_form

    @student = Student.where('id = 1')

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
    medication_id = params['medication_id']
    if med_type.eql? 'student'
      MedicationApproval.create!({:student_id => student_id, :student_or_school => med_type, :student_medication_id => medication_id})
    else
      MedicationApproval.create!({:student_id => student_id, :student_or_school => med_type, :school_medication_id => medication_id})
    end
    redirect_to :consent_form
  end

  def disapprove_medication
    student_id = params['student_id']
    med_type = params['med_type']
    medication_id = params['medication_id']
    if med_type.eql? 'student'
      med_to_disapprove = MedicationApproval.where("student_id = "+student_id+" AND student_or_school = '"+med_type+"' AND student_medication_id = "+medication_id)
      med_to_disapprove[0].destroy
      # med_to_disapprove.save!
      # MedicationApproval.create!({:student_id => student_id, :student_or_school => med_type, :student_medication_id => medication_id})
    else
      med_to_disapprove = MedicationApproval.where("student_id = "+student_id+" AND student_or_school = '"+med_type+"' AND school_medication_id = "+medication_id)
      med_to_disapprove[0].destroy
      # med_to_disapprove.save!
      # MedicationApproval.create!({:student_id => student_id, :student_or_school => med_type, :school_medication_id => medication_id})
    end
    redirect_to :consent_form #and return
  end

end
