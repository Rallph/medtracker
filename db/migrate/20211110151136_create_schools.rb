class CreateSchools < ActiveRecord::Migration

  def change
    create_table :schools do |t|
      t.string :school_name
    end
  end

  # def down
  #   drop_table :schools
  # end

end
