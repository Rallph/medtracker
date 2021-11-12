class CreateJoinTableSchoolMedicationSchoolMedicationTransaction < ActiveRecord::Migration
  def up
    create_join_table :school_medications, :school_medication_transactions do |t|
    end
  end

  def down
    drop_join_table :school_medications, :school_medication_transactions
  end
end
