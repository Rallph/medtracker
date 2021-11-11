class CreateNurses < ActiveRecord::Migration

  def up
    create_table :nurses do |t|
      t.string :full_name
      t.string :username
      t.string :password_digest
      t.references :school
    end
  end

  def down
    drop_table :nurses
  end

end
