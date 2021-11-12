class CreateStudentMedicationTransactions < ActiveRecord::Migration
  def change
    create_table :student_medication_transactions do |t|

      t.timestamps null: false
    end
  end
end
