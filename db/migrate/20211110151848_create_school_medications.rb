class CreateSchoolMedications < ActiveRecord::Migration

  def up
    create_table :school_medications do |t|
      t.string :medication_name
      t.integer :quantity
      t.string :unit
      t.references :school
    end
  end

  def down
    drop_table :school_medications
  end

end
