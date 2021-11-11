class CreateMedicationTransactions < ActiveRecord::Migration
  def up
    create_table :medication_transactions do |t|
      t.string :date
      t.string :time
      t.string :change_in_quantity
      t.references :school_medication
      t.references :student
      t.references :nurse
    end
  end

  def down
    drop_table :medication_transactions
  end
end
