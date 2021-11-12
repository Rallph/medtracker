class CreateStudentMedicationTransactions < ActiveRecord::Migration
  def up
    create_table :student_medication_transactions do |t|
      t.string :date
      t.string :time
      t.string :change_in_quantity
      t.references :student_medication
      t.references :nurse
    end
  end

  def down
    drop_table :student_medication_transactions
  end
end
