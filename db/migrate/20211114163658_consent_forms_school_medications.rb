class ConsentFormsSchoolMedications < ActiveRecord::Migration
  def up
    create_join_table :consent_forms, :school_medications do |t|
    end
  end

  def down
    drop_join_table :consent_forms, :school_medications
  end
end
