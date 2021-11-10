class CreateConsentForms < ActiveRecord::Migration
  def change
    create_table :consent_forms do |t|

      t.timestamps null: false
    end
  end
end
