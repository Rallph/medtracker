class CreateJoinTableStudentMedicationStudentMedicationTransaction < ActiveRecord::Migration
  def up
    create_join_table :student_medications, :student_medication_transactions do |t|
    end
  end

  def down
    drop_join_table :student_medications, :student_medication_transactions
  end
end