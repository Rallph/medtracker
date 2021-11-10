class CreateConsentForms < ActiveRecord::Migration
  def up
    create_table :consent_forms do |t|
      t.string :date
      t.reference :parent
      t.reference :student
    end
  end
end
