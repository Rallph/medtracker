class CreateSchoolMedications < ActiveRecord::Migration
  def change
    create_table :school_medications do |t|

      t.timestamps null: false
    end
  end
end
