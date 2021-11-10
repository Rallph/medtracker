class CreateMedicationTransactions < ActiveRecord::Migration
  def change
    create_table :medication_transactions do |t|

      t.timestamps null: false
    end
  end
end
