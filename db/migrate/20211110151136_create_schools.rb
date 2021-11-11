class CreateSchools < ActiveRecord::Migration

  def up
    create_table :schools do |t|
      t.string :school_name
      t.references :district
    end
  end

  def down
    drop_table :schools
  end

end
