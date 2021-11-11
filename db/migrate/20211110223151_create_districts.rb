class CreateDistricts < ActiveRecord::Migration
  def up
    create_table :districts do |t|
      t.string :district_name
    end
  end
  def down
    drop_table :districts
  end
end
