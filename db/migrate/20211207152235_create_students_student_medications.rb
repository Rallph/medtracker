class CreateStudentsStudentMedications < ActiveRecord::Migration
  def change
    create_join_table :students, :student_medications do |t|
    end
  end
end
