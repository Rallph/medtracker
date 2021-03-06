class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string :full_name
      t.string :date_of_birth
      t.references :school
    end
  end

  def down
    drop_table :students
  end
end
