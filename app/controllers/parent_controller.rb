class ParentController < ApplicationController
  def homepage

  end


  def consent_form

    # sql = "SELECT * from posts where id = #{params[:id}"
    # result = ActiveRecord::Base.connection.execute(sql)

    # result.to_a


    @student = Student.where('id = 1')
    @student_medications = StudentMedication.where('student_id = 1')
    @student.each do |student|
      @student_medications.each do |sm|
        puts 'here'
        puts student.student_medications
        student.student_medications << sm
        # student.save!
        # puts student.student_medications

        # sm.students << student
      end
    end
  end


end
