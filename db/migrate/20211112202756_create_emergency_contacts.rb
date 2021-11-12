class CreateEmergencyContacts < ActiveRecord::Migration
  def up
    create_table :emergency_contacts do |t|
      t.string :full_name
      t.string :relation
      t.string :phone_number
    end
  end
  def down
    drop_table :emergency_contacts
  end
end
