class CreateMedicationTransactions < ActiveRecord::Migration
  def up
    create_table :medication_transactions do |t|
      t.string :date
      t.string :time
      t.string :change_in_quantity
      t.reference :school_medication
      t.reference :student
      t.reference :nurse
    end
  end

  def down
    drop_table :medication_transactions
  end
end
