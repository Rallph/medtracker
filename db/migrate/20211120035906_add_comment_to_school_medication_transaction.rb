class AddCommentToSchoolMedicationTransaction < ActiveRecord::Migration
  def change
    add_column :school_medication_transactions, :comment, :string
  end
end
