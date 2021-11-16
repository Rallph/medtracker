class ConsentFormsStudentMedications < ActiveRecord::Migration
  def up
    create_join_table :consent_forms, :student_medications do |t|
    end
  end

  def down
    drop_join_table :consent_forms, :student_medications
  end
end
