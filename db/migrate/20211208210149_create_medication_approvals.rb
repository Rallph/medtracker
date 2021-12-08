class CreateMedicationApprovals < ActiveRecord::Migration
  def up
    create_table :medication_approvals do |t|
      t.string :student_or_school
      t.references :school_medication
      t.references :school_medication
    end
  end

  def down
    drop_table :medication_approvals
  end
end