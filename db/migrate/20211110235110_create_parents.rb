class CreateParents < ActiveRecord::Migration
  def up
    create_table :parents do |t|
      t.string :full_name
      t.string :email
    end
  end
  def down
    drop_table :parents
  end
end
