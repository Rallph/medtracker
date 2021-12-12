class AddCommentToStudentMedicationTransaction < ActiveRecord::Migration
  def change
    add_column :student_medication_transactions, :comment, :string
  end
end
