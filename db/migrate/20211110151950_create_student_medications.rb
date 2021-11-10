class CreateStudentMedications < ActiveRecord::Migration
  def change
    create_table :student_medications do |t|

      t.timestamps null: false
    end
  end
end
