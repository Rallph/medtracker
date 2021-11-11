class CreateConsentForms < ActiveRecord::Migration
  def up
    create_table :consent_forms do |t|
      t.string :date
      t.references :parent
      t.references :student
    end
  end
  def down
    drop_table :consent_forms
  end
end
