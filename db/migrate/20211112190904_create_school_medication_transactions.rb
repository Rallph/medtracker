class CreateSchoolMedicationTransactions < ActiveRecord::Migration
  def change
    create_table :school_medication_transactions do |t|

      t.timestamps null: false
    end
  end
end
