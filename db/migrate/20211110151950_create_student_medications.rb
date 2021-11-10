class CreateStudentMedications < ActiveRecord::Migration
  def up
    create_table :student_medications do |t|
      t.string :medication_name
      t.integer :quantity
      t.string :unit
      t.reference :school
      t.reference :student
    end
  end
  def down
    drop_table :student_medications
  end
end
