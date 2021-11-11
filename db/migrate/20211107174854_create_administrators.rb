class CreateAdministrators < ActiveRecord::Migration

  def up
    create_table :administrators do |t|
      t.string :full_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.references :school
    end
  end

  def down
    drop_table :administrators
  end

end
