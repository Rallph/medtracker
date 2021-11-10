class CreateDistricts < ActiveRecord::Migration
  def up
    create_table :districts do |t|
      t.string :district_name
    end
  end
end
