class ParentController < ApplicationController
  def homepage

  end

  def inventory
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
end
