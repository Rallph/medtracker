class CreateAdministrators < ActiveRecord::Migration

  def up
    create_table :administrators do |t|
      t.string :full_name
      t.string :username
      t.string :password
    end
  end

  def down
    drop_table :administrators
  end

end