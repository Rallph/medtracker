class CreateMedicationApprovals < ActiveRecord::Migration
  def up
    create_table :medication_approvals do |t|
      t.string :student_or_school
      t.references :student_medication
      t.references :school_medication
      t.references :student

      t.timestamps null: false
    end
  end

  def down
    drop_table :medication_approvals
  end
end
